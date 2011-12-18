try{
									var gblImg = new Array("./css/images/login/mid1.png", "./css/images/login/mid2.png","./css/images/login/mid3.png","./css/images/login/top.png");
									var gblHref = new Array("#","#","#","#");
									var gblPhotoShufflerDivId = "hp_flash_banner";
									var gblPhotoShufflerImgId = "photoimg";
									var gblPhotoShufflerAnchorId = "photoanchor";
									var gblPauseSeconds = 2.25;
									var gblFadeSeconds = .85;
									var gblRotations = 100;
									var gblDeckSize = gblImg.length;
									var gblOpacity = 100;
									var gblOnDeck = 0;
									var gblStartImg;
									var gblStartHref;
									var gblImageRotations = gblDeckSize * (gblRotations + 1);
						
									function photoShufflerLaunch(){
									    var theimg = document.getElementById(gblPhotoShufflerImgId);
									    gblStartImg = theimg.src;
									    var theanchor = document.getElementById(gblPhotoShufflerAnchorId);
									    gblStartHref = theimg.href;
									    //document.getElementById(gblPhotoShufflerDivId).style.backgroundImage = 'url(s' + gblImg[gblOnDeck] + ')';
									    setTimeout("photoShufflerFade()", gblPauseSeconds * 1000);
									}
						
									function photoShufflerFade(){
									    var theimg = document.getElementById(gblPhotoShufflerImgId);
										var fadeDelta = 100 / (30 * gblFadeSeconds);
										if (gblOpacity < 2 * fadeDelta) {
										  gblOpacity = 0;
										  if (gblImageRotations < 1) return;
										  photoShufflerShuffle();
										  setTimeout("photoShufflerFade()", gblPauseSeconds * 1000)
										} else {
											
											gblOpacity = 0;
											 if (gblImageRotations < 1) return;
											  photoShufflerShuffle();
											  
										  //gblOpacity -= fadeDelta;
										  //setOpacity(theimg, gblOpacity);
										  setTimeout("photoShufflerFade()", 0)
										}
									}
						
									function photoShufflerShuffle(){
									    var thediv = document.getElementById(gblPhotoShufflerDivId);
										var theimg = document.getElementById(gblPhotoShufflerImgId);
										var theanchor = document.getElementById(gblPhotoShufflerAnchorId);
										theimg.src = gblImg[gblOnDeck];
										theanchor.href = gblHref[gblOnDeck];
										window.status = gblHref[gblOnDeck];
										setOpacity(theimg, 100);
										gblOnDeck = ++gblOnDeck % gblDeckSize;
						
										if (--gblImageRotations < 1) {
										    gblImg[gblOnDeck] = gblStartImg;
											gblHref[gblOnDeck] = gblStartHref
										}
										//thediv.style.backgroundImage = 'url(' + gblImg[gblOnDeck] + ')'
										//thediv.style.width= '100%'
									}
						
									function setOpacity(obj, opacity) {
									    opacity = (opacity == 100) ? 99.999 : opacity;
										obj.style.filter = "alpha(opacity:" + opacity + ")";
										obj.style.KHTMLOpacity = opacity / 100;
										obj.style.MozOpacity = opacity / 100;
										obj.style.opacity = opacity / 100
										//obj.style.width= '100%'
									}
						     } catch (err) {}
