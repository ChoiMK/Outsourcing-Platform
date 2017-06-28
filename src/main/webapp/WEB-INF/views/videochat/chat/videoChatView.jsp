<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/css/bootstrap.css">

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
*{font-family: 'Jeju Gothic', sans-serif;}
.local-video {
      width: 165px;
      height: 165px;
    }
    .remote-video {
      width: 320px;
      height: 240px;
    }

    @media (min-width: 992px) {
      .remote-video {
        width: 610px;
        height: 480px;
      }
    }
    .chat-timeline {
      height: 200px;
      font-size: 9px;
       overflow-x: hidden;
        overflow-y: auto;
    }
    .chat-timeline .local {
      color: blue;
    }
    .chat-timeline .remote {
      color: red;
    }
hr{
    border:solid 5px;
    color: #2dcc70;
    margin-top: 80px;
}    
</style>

</head>
<body>
<div class="container">
    <div class="row" style="padding-top : 30px; padding-bottom: 30px;">
    
      <div class="col-md-12">
      <img class="aaaa" style="cursor:pointer;" src="${pageContext.request.contextPath}/resources/images/logo.png"/>
      </div>
      <hr>

      <div class="col-md-6 col-md-offset-3 hide">
        <div class="alert alert-info alert-dismissible" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          ...
        </div>
      </div>
    </div>

   <div class="row">
        <form>
          <div class="from-gruop">
         <div class="clientBtn">
         <div class="col-md-4">
               <input class="form-control" type="text" id="createChannelId" placeholder="Create and connect the channel." value="" readonly=""  style="height: 41px;">
         </div>
         <div class="col-md-4">
                 <button class="btn btn-success  btn-sm btn-block" id="createChannel" style="border-bottom-width: 0px; border-top-width: 0px; height: 40px;">
               <span class="glyphicon glyphicon-camera" aria-hidden="true"></span> 화상 미팅 연결
                </button>
           </div>
           </div>
           
         <div class="freelancerBtn">
         <div class="col-md-4">
               <input class="form-control" type="text" id="connectChannelId" placeholder="Enter the ChannelId." value="" >
         </div>
         <div class="col-md-4">
                 <button class="btn btn-success  btn-sm btn-block" id="connectChannel" style="border-bottom-width: 0px; border-top-width: 0px; height: 40px;">
               <span class="glyphicon glyphicon-camera" aria-hidden="true"></span> 화상 미팅 연결
                </button>
           </div>
           </div>
          
         <div class="col-md-4">
        <button class="btn btn-danger btn-sm btn-block" id="disconnectChannel" style="border-bottom-width: 0px; border-top-width: 0px; height: 40px;">
         <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 화상 미팅 종료
        </button>
          </div>
        </div>
        </form>
      

   
   </div>
    <div class="row" style="margin-top: 20px";>
   
         <div class="col-md-4">
        <div class="well">
          <video class="local-video center-block" id="localVideo" muted></video>

          <div class="progress" id="sendFileToRemoteBarWrapper">
            <div class="progress-bar" id="sendFileToRemoteBar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0px;">
              <!--<span class="sr-only">60% Complete</span>-->
            </div>
          </div>

          <div class="text-center">
            <span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>
            <div class="btn-group" role="group" aria-label="...">
              <button class="btn btn-default btn-sm" id="startLocalVideoRecord">
                <span class="glyphicon glyphicon-film" aria-hidden="true"></span> 녹화
              </button>
              <button class="btn btn-default btn-sm" id="stopLocalVideoRecord">
                <span class="glyphicon glyphicon-stop" aria-hidden="true"></span> 일시정지
              </button>
              <button class="btn btn-default btn-sm" id="saveLocalVideoRecord">
                <span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> 저장
              </button>
            </div>
          </div>

        </div>

        <div class="well chat-timeline" id="timeline">
        </div>

        <form>
          <label class="sr-only" for="sendMessage">Transfer Message</label>
            <div style="margin-bottom: 10px;">
               <div class="input-group input-group-sm">
               <div class="input-group-addon">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                  </div>
                 <input type="text" class="form-control" id="sendMessage">
               <span class="input-group-btn">
                 <button class="btn btn-default" id="sendText">
                <span class="glyphicon glyphicon-send" aria-hidden="true"></span> 전송
              </button>
            </span>
            </div>
          </div>
        </form>

        <form class="form-inline">
          <div class="row">
            <div class="col-md-8">
              <label class="sr-only" for="selectFile">Choose File</label>
              <input type="file" id="selectFile">
            </div>
            <div class="col-md-4">
              <button class="btn btn-default btn-xs pull-right" id="sendFile">
                <span class="glyphicon glyphicon-send" aria-hidden="true"></span> 전송
              </button>
            </div>
          </div>
        </form>

      </div>
   
   
   
      
      <div class="col-md-8">
        <div class="well">
          <video class="remote-video center-block" id="remoteVideo"></video>

          <div class="text-center hide">
            <button class="btn btn-default btn-sm" id="saveFileFromRemote">
              <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> Save
            </button>
          </div>

          <div class="text-center">
            <span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>
            <div class="btn-group" role="group" aria-label="...">
              <button class="btn btn-default btn-sm" id="startRemoteVideoRecord">
                <span class="glyphicon glyphicon-film" aria-hidden="true"></span> 녹화
              </button>
              <button class="btn btn-default btn-sm" id="stopRemoteVideoRecord">
                <span class="glyphicon glyphicon-stop" aria-hidden="true"></span> 일시정지
              </button>
              <button class="btn btn-default btn-sm" id="saveRemoteVideoRecord">
                <span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> 저장
              </button>
            </div>
          </div>
        </div>

      </div>

    </div>
  </div>

  <!-- jquery -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.4.js"></script>
  <!-- bootstrap -->
  <script src="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
  <!-- playrtc.js -->
  <script src="${pageContext.request.contextPath}/resources/js/playrtc.js"></script>
  
  <script>
  $(function(){
	  $(".aaaa").click(function(){
		  $(location).attr('href','${pageContext.request.contextPath}/main.do');
	  });
	  
	  var re_roomCode = "${param.roomCode}";
	  if(re_roomCode != ''){
		  $("#connectChannelId").val(re_roomCode);
	  }
	  var roomCode =  '';
	  var cnt_id = "${LOGIN_MEMBERINFO.mem_id}";
	  var free_id = "${param.free_nm}";
  
    'use strict';

    var createChannelButton = document.querySelector('#createChannel');
    var createChannelIdInput = document.querySelector('#createChannelId');
    var connectChannelIdInput = document.querySelector('#connectChannelId');
    var connectChannelButton = document.querySelector('#connectChannel');
    var disconnectChannelButton = document.querySelector('#disconnectChannel');
    var startRemoteVideoRecordButton = document.querySelector('#startRemoteVideoRecord');
    var stopRemoteVideoRecordButton = document.querySelector('#stopRemoteVideoRecord');
    var saveRemoteVideoRecordButton = document.querySelector('#saveRemoteVideoRecord');
    var startLocalVideoRecordButton = document.querySelector('#startLocalVideoRecord');
    var stopLocalVideoRecordButton = document.querySelector('#stopLocalVideoRecord');
    var saveLocalVideoRecordButton = document.querySelector('#saveLocalVideoRecord');
    var chattingTimeline = document.querySelector('#timeline');
    var sendMessageInput = document.querySelector('#sendMessage');
    var selectFileInput = document.querySelector('#selectFile');
    var sendTextButton = document.querySelector('#sendText');
    var sendFileButton = document.querySelector('#sendFile');
    var sendFileToRemoteBar = document.querySelector('#sendFileToRemoteBar');
    var sendFileToRemoteBarWrapper = document.querySelector('#sendFileToRemoteBarWrapper');
    var remoteVideo = document.querySelector('#remoteVideo');
    var localVideo = document.querySelector('#localVideo');
    var recordedRemoteVideoBlob;
    var recordedRemoteVoiceBlob;
    var recordedLocalVideoBlob;
    var recordedLocalVoiceBlob;
    var app;

    app = new PlayRTC({
      projectKey: '60ba608a-e228-4530-8711-fa38004719c1',
      localMediaTarget: 'localVideo',
      remoteMediaTarget: 'remoteVideo',
      ring: true
    });
    
    app.on('ring', function(pid, uid) {
        if (window.confirm('Would you like to get a call?')) {
           app.accept(pid);
        } else {
           app.reject(pid);
        }
      });
    app.on('accept', function() {
    	alert("화상미팅을 시작합니다.");
    });

    app.on('reject', function() {
    	alert("화상미팅을 시작합니다.");
      });


    app.on('connectChannel', function (channelId) {
      createChannelIdInput.value = channelId;
          roomCode =  $("#createChannelId").val();
          
          $.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/mettingRelay.do",
				dataType:"json",
				data:{free_id : free_id, cnt_id: cnt_id, roomCode: roomCode},
				success:function(){
					
					}
				});
          });


    app.on('otherDisconnectChannel', function (channelId) {
      remoteVideo.src = '';

      while (chattingTimeline.hasChildNodes()) {
        chattingTimeline.removeChild(chattingTimeline.firstChild);
      }
    });

    app.on('addDataStream', function (pid, uid, dataChannel) {
      dataChannel.on('message', function (message) {
        var chatParagraph;

        if (message.type === 'text') {
          chatParagraph = document.createElement('p');
          chatParagraph.classList.add('local');
          chatParagraph.textContent = message.data;

          chattingTimeline.appendChild(chatParagraph);
        } else if (message.type === 'binary') {
          PlayRTC.utils.fileDownload(message.blob, message.fileName);
          sendFileToRemoteBar.style.width = '0px';
        }
      });

      dataChannel.on('progress', function (message) {
        var width = sendFileToRemoteBarWrapper.clientWidth;
        var progressbar = (width / message.fragCount) * (message.fragIndex + 1);

        if (message.totalSize === message.fragSize) {
          return;
        }

        sendFileToRemoteBar.style.width = progressbar + 'px';
      });

      dataChannel.on('error', function (event) {
        alert('ERROR. See the log.');
      });
    });


    createChannelButton.addEventListener('click', function(event) {
        event.preventDefault();
        app.createChannel();
      }, false);
    
    
    connectChannelButton.addEventListener('click', function(event) {
        var channelId = connectChannelIdInput.value;

        event.preventDefault();
        if (!channelId) {
          return;
        }
        app.connectChannel(channelId);
      }, false);
    

    disconnectChannelButton.addEventListener('click', function (event) {
      event.preventDefault();
      app.disconnectChannel();
    }, false);

    startRemoteVideoRecordButton.addEventListener('click', function (event) {
      var peers = app.getAllPeer();
      var hasPeers = peers.length > 0;
      var firstPeerMedia = peers[0].getMedia();

      event.preventDefault();

      if (hasPeers) {
        firstPeerMedia.record();
      }
    }, false);

    stopRemoteVideoRecordButton.addEventListener('click', function (event) {
      var peers = app.getAllPeer();
      var hasPeers = peers.length > 0;
      var firstPeerMedia = peers[0].getMedia();

      event.preventDefault();

      if (hasPeers) {
        firstPeerMedia.recordStop(function (blob) {
          recordedRemoteVideoBlob = blob;
        });
      }
    }, false);

    saveRemoteVideoRecordButton.addEventListener('click', function (event) {
      event.preventDefault();
      if (recordedRemoteVideoBlob) {
        PlayRTC.utils.fileDownload(recordedRemoteVideoBlob, 'remote-video.webm');
      }
    }, false);

    startLocalVideoRecordButton.addEventListener('click', function (event) {
      var media = app.getMedia();

      event.preventDefault();

      if (media) {
        media.record();
      }
    }, false);

    stopLocalVideoRecordButton.addEventListener('click', function (event) {
      var media = app.getMedia();

      event.preventDefault();
      if (media) {
        media.recordStop(function (blob) {
          recordedLocalVideoBlob = blob;
        });
      }
    }, false);

    saveLocalVideoRecordButton.addEventListener('click', function (event) {
      event.preventDefault();
      if (recordedLocalVideoBlob) {
        PlayRTC.utils.fileDownload(recordedLocalVideoBlob, 'local-video.webm');
      }
    }, false);

    sendTextButton.addEventListener('click', function (event) {
      var chatParagraph;
      var message = sendMessageInput.value;

      event.preventDefault();

      if (message) {
        app.sendText(message);

        chatParagraph = document.createElement('p');
        chatParagraph.classList.add('remote');
        chatParagraph.textContent = message;

        chattingTimeline.appendChild(chatParagraph);
        $("#timeline").scrollTop($("#timeline")[0].scrollHeight);
      }
      sendMessageInput.value = '';
    }, false);

    sendFileButton.addEventListener('click', function (event) {
      var myFile = selectFileInput.files[0];

      event.preventDefault();

      if (!myFile) {
        return false;
      }
      app.sendFile(myFile);
      selectFileInput.value = '';
    }, false);
    
    if(eval("${LOGIN_MEMBERINFO.mem_type eq 'C'}")){
        $(".freelancerBtn").hide();
     }else{
        $(".clientBtn").hide();
     }
     
     
});
  </script>
</body>
</html>