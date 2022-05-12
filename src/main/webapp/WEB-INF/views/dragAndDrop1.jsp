<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dragAndDrop</title>
<link rel="stylesheet" type="text/css" href="./css/dragAndDrop.css">
<script type="text/javascript">
function onDragStart(event) {
	  event
	    .dataTransfer
	    .setData('text/plain', event.target.id);

// 	  event
// 	    .currentTarget
// 	    .style
// 	    .backgroundColor = 'yellow';
	}
	
function onDragOver(event) {
	  event.preventDefault();
	}
	
function onDrop(event) {
	  const id = event
	    .dataTransfer
	    .getData('text');
	  
	  const draggableElement = document.getElementById(id);
	  const dropzone = event.target;
	  dropzone.appendChild(draggableElement);
	  
	  event
	    .dataTransfer
	    .clearData();
	}
</script>
</head>
<body>
	<div id="wrapper">
		<%@ include file="./header.jsp"%>

		<h3>Drag and Drop Example</h3>

		<div class="example-parent">
			<div class="example-origin">
				<div id="draggable-1" class="example-draggable" draggable="true" ondragstart="onDragStart(event)">
					draggable</div>
			</div>

			<div class="example-dropzone" ondragover="onDragOver(event)" ondrop="onDrop(event)">dropzone</div>
		</div>
		<div class="example-parent">
  <h1>To-do list</h1>
  <div class="example-origin">
    To-do
    <div
      id="draggable-1"
      class="example-draggable"
      draggable="true"
      ondragstart="onDragStart(event);"
    >
      thing 1
    </div>
    <div
      id="draggable-2"
      class="example-draggable"
      draggable="true"
      ondragstart="onDragStart(event);"
    >
      thing 2
    </div>
    <div
      id="draggable-3"
      class="example-draggable"
      draggable="true"
      ondragstart="onDragStart(event);"
    >
      thing 3
    </div>
    <div
      id="draggable-4"
      class="example-draggable"
      draggable="true"
      ondragstart="onDragStart(event);"
    >
      thing 4
    </div>
  </div>

  <div
    class="example-dropzone"
    ondragover="onDragOver(event);"
    ondrop="onDrop(event);"
  >
    Done
  </div>
</div>
	</div>
</body>
</html>