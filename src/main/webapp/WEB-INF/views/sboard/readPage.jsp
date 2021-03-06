<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<div class="box-body">
					<!-- ${board} -->
					<div class="form-group">
						<label>TITLE</label>
						<input type="text" 
								name="title" 
								class="form-control"
								 value="${board.title}" 
								 readonly/>
					</div>
					<div class="form-group">
						<label>CONTENT</label>
						<textarea class="form-control" rows=4 readonly>${board.content}</textarea>
					</div>
					<div class="form-group">
						<label>WRITER</label>
						<input type="text" 
								class="form-control"
								 value="${board.writer}" 
								 readonly/>
					</div>
				</div>
				<div class="box-footer">
					<!-- bottom -->
					<input type="button" class="btn btn-warning" value="MODIFY"/>
					<input type="button" class="btn btn-danger" value="DELETE"/>
					<input type="button" class="btn btn-primary" value="LIST"/>
					<form id="readForm" method="post">
						<input type="hidden" name="bno" value="${board.bno}"/>
						<input type="hidden" name="page" value="${cri.page}"/>
						<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
						<input type="hidden" name="searchType" value="${cri.searchType}"/>
						<input type="hidden" name="keyword" value="${cri.keyword}"/>
					</form>
				</div>
			</div>		
		</div>
	</div>
</section>
<script>
	// 문서가 준비되었을때
	$(function(){
		var msg = '${result}';
		
		if(msg == 'SUCCESS'){
			alert('수정처리가 완료되었습니다.');
		}
		
		if(msg == 'FAIL'){
			alert('수정처리가 정상적으로 완료되지 않았습니다.');
		}
		
		var readForm = $("#readForm");
		
		$(".btn-warning").click(function(){
			//alert('click');
			readForm.attr("action","/sboard/modifyPage");
			readForm.attr("method","GET");
			readForm.submit();
		});
		
		$(".btn-danger").click(function(){
			readForm.attr("action","/sboard/remove").submit();
		});
		
		$(".btn-primary").click(function(){
			readForm.attr("action","/sboard/list");
			readForm.attr("method","get");
			readForm.submit();
		});
	});
</script>
<jsp:include page="../include/footer.jsp"/>







