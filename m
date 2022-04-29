Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2D6C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:10:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.12166.1651248650079933660
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 09:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1186540C46;
	Fri, 29 Apr 2022 16:10:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_02u7-VLC9Y; Fri, 29 Apr 2022 16:10:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DAE7C40A77;
	Fri, 29 Apr 2022 16:10:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A251F174913; Fri, 29 Apr 2022 12:10:44 -0400 (EDT)
Date: Fri, 29 Apr 2022 12:10:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com,
	daniel.thompson@linaro.org
Subject: Re: [PATCH v2 2/2] external-arm-toolchain: Add support for Arm GCC
 11.2 binary release
Message-ID: <20220429161044.GP9834@denix.org>
References: <20220429062142.11206-1-sumit.garg@linaro.org>
 <20220429062142.11206-2-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429062142.11206-2-sumit.garg@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Apr 2022 16:10:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3334

On Fri, Apr 29, 2022 at 11:51:42AM +0530, Sumit Garg wrote:
> Arm GCC 11.2 binary release has completely changed the way how libc was
> packaged in earlier binary releases. So adjust do_install() accordingly
> to support Arm GCC 11.2 as well as earlier binary releases.
> 
> Along with this update CI as well to point at Arm GCC 11.2 binary
> releases.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Reviewed-by: Denys Dmytriyenko <denis@denix.org>


> ---
> 
> Changes in v2:
> - None
> 
>  ci/get-binary-toolchains                      | 10 ++--
>  .../external-arm-toolchain.bb                 | 47 ++++++++-----------
>  2 files changed, 25 insertions(+), 32 deletions(-)
> 
> diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> index 838342a..bfdd8c5 100755
> --- a/ci/get-binary-toolchains
> +++ b/ci/get-binary-toolchains
> @@ -2,7 +2,7 @@
>  set -u
>  
>  HOST_ARCH=$(uname -m)
> -VER="10.3-2021.07"
> +VER="11.2-2022.02"
>  
>  DOWNLOAD_DIR=$1
>  TOOLCHAIN_DIR=$2
> @@ -15,18 +15,18 @@ if [ $HOST_ARCH = "aarch64" ]; then
>  	#AArch64 Linux hosted cross compilers
>  
>  	#AArch32 target with hard float (arm-none-linux-gnueabihf)
> -	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> +	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
>  elif [ $HOST_ARCH = "x86_64" ]; then
>  	#x86_64 Linux hosted cross compilers
>  
>  	#AArch32 target with hard float (arm-linux-none-gnueabihf)
> -	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> +	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
>  
>  	#AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> -	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> +	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
>  
>  	#AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
> -	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
> +	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
>  else
>  	echo "ERROR - Unknown build arch of $HOST_ARCH"
>  	exit 1
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index a58eeb4..dcc8ebf 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -79,29 +79,10 @@ do_install() {
>  
>  	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>  	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/*  ${D}${base_libdir}
> -	if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/${EAT_TARGET_SYS} ]; then
> -		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/${EAT_TARGET_SYS}/*  ${D}${base_libdir}
> -	else
> -		if [ -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
> -			cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/*  ${D}${base_libdir}
> -		else
> -			cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LIBDIR}/*.so*  ${D}${base_libdir}
> -		fi
> -	fi
> -	if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LIBDIR}/${EAT_TARGET_SYS} ]; then
> -		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}/*  ${D}${libdir}
> -	else
> -		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LIBDIR}/*  ${D}${libdir}
> -		if [ ! -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
> -			rm -rf ${D}${libdir}/*.so*
> -		fi
> -	fi
> +	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/*  ${D}${base_libdir}
> +	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LIBDIR}/*  ${D}${libdir}
>  	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/share/*  ${D}${datadir}
>  	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include/*  ${D}${includedir}
> -	if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include/${EAT_TARGET_SYS} ]; then
> -		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include/${EAT_TARGET_SYS}/*  ${D}${includedir}
> -		rm -r ${D}${includedir}/${EAT_TARGET_SYS}
> -	fi
>  
>  	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${includedir}
>  	if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ]; then
> @@ -128,7 +109,11 @@ do_install() {
>  
>  	# fix up the copied symlinks (they are still pointing to the multiarch directory)
>  	linker_name="${@bb.utils.contains("TUNE_FEATURES", "aarch64", "ld-linux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
> -	ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}
> +	if [ -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
> +		ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}
> +	else
> +		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/lib/${linker_name} ${D}${base_libdir}/
> +	fi
>  	ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so
>  	ln -sf ../../lib/libcrypt.so.1 ${D}${libdir}/libcrypt.so
>  	ln -sf ../../lib/libresolv.so.2 ${D}${libdir}/libresolv.so
> @@ -144,6 +129,7 @@ do_install() {
>  	ln -sf ../../lib/libnss_files.so.2 ${D}${libdir}/libnss_files.so
>  	ln -sf ../../lib/libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
>  	ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
> +	ln -sf ../../lib/libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
>  
>  	# remove potential .so duplicates from base_libdir
>  	# for all symlinks created above in libdir
> @@ -164,7 +150,7 @@ do_install() {
>  	rm -f ${D}${base_libdir}/libm.so
>  
>  	# Move these completely to ${libdir} and delete duplicates in ${base_libdir}
> -	for lib in asan atomic gfortran gomp itm lsan sanitizer stdc++ tsan ubsan; do
> +	for lib in asan hwasan atomic gfortran gomp itm lsan sanitizer stdc++ tsan ubsan; do
>  		if [ -e ${D}${base_libdir}/lib${lib}.spec ] ; then
>  			mv ${D}${base_libdir}/lib${lib}.spec ${D}${libdir}
>  		fi
> @@ -180,6 +166,10 @@ do_install() {
>  	# Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicates like lib*-${EAT_VER_LIBC}.so
>  	# Only remove them if both are regular files and are identical
>  	for i in ${D}${base_libdir}/lib*-${EAT_VER_LIBC}.so; do
> +		if [ ! -e $i ] ; then
> +			continue
> +		fi
> +
>  		f=$(echo $i | sed 's/-${EAT_VER_LIBC}//')
>  		l=$(ls $f.*)
>  		if [ $(readlink -f $i ) = $l ]; then
> @@ -217,9 +207,9 @@ do_install() {
>  	fi
>  
>  	if [ -f ${D}${base_libdir}/libc.so ];then
> -		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../lib#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
> +		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../lib#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
>  		if [ -f ${D}${base_libdir}/libc.so.6 ]; then
> -			sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_libdir}/libc.so.6
> +			sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_libdir}/libc.so.6
>  		fi
>  	fi
>  
> @@ -460,13 +450,16 @@ FILES:libgfortran-staticdev = "${libdir}/libgfortran.a"
>  
>  # From gcc-sanitizers.inc:
>  
> -FILES:libasan += "${libdir}/libasan.so.*"
> +FILES:libasan += "${libdir}/libasan.so.* ${libdir}/libhwasan.so.*"
>  FILES:libasan-dev += "\
>      ${libdir}/libasan_preinit.o \
>      ${libdir}/libasan.so \
> +    ${libdir}/libhwasan.so \
>      ${libdir}/libasan.la \
>  "
> -FILES:libasan-staticdev += "${libdir}/libasan.a"
> +FILES:libasan-staticdev += "${libdir}/libasan.a \
> +    ${libdir}/libhwasan.a \
> +"
>  
>  FILES:libubsan += "${libdir}/libubsan.so.*"
>  FILES:libubsan-dev += "\
> -- 
> 2.25.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

