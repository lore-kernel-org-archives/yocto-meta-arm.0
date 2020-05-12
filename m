Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5555.1589243464410062862
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 17:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D86F640951;
	Tue, 12 May 2020 00:31:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lRGUP0BeCNB; Tue, 12 May 2020 00:31:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8FAD640A46;
	Tue, 12 May 2020 00:31:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5324D173145; Mon, 11 May 2020 20:31:00 -0400 (EDT)
Date: Mon, 11 May 2020 20:31:00 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] Add recipes for TF-A versions 2.2 and 2.3
Message-ID: <20200512003100.GO11927@denix.org>
References: <20200512002050.11739-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200512002050.11739-1-jon.mason@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 08:20:50PM -0400, Jon Mason wrote:
> Add basic recipes for TF-A versions 2.2 and 2.3.  Also, rearrange fields
> in the various TF-A recipes to make them uniform and move the
> do_compile_prepend to the inc file.
> 
> Change-Id: I85e4ac7bdc44ed85449e40fd2c94d73bf3e7d9e8
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta-arm-bsp/conf/machine/juno.conf           |  1 +
>  .../trusted-firmware-a/trusted-firmware-a.inc | 13 ++++++-
>  .../trusted-firmware-a_2.1.bb                 | 20 ++--------
>  .../trusted-firmware-a_2.2.bb                 | 38 +++++++++++++++++++
>  .../trusted-firmware-a_2.3.bb                 | 38 +++++++++++++++++++
>  .../trusted-firmware-a_git.bb                 | 29 ++++++--------

Any point in keeping git, 2.1, 2.2 and 2.3 around? Can we simplify it into one 
version?


>  6 files changed, 103 insertions(+), 36 deletions(-)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> 
> diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
> index 878b6b1..898a863 100644
> --- a/meta-arm-bsp/conf/machine/juno.conf
> +++ b/meta-arm-bsp/conf/machine/juno.conf
> @@ -20,6 +20,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>  # Use kernel provided by linaro (Contains support for SCMi or HDMI)
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
>  PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.1%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
>  
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 93ca199..50a97a7 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -81,8 +81,19 @@ DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}"
>  do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot:do_deploy', '', d)}"
>  EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', ' BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
>  
> -
> +# The following hack is needed to fit properly in yocto build environment
> +# TFA is forcing the host compiler and its flags in the Makefile using :=
> +# assignment for GCC and CFLAGS.
> +# To properly use the native toolchain of yocto and the right libraries we need
> +# to pass the proper flags to gcc. This is achieved here by creating a gcc
> +# script to force passing to gcc the right CFLAGS and LDFLAGS
>  do_compile() {
> +    # Create an host gcc build parser to ensure the proper include path is used
> +    mkdir -p bin
> +    echo "#!/usr/bin/env bash" > bin/gcc
> +    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \$@" >> bin/gcc
> +    chmod a+x bin/gcc
> +    export PATH="$PWD/bin:$PATH"
>      oe_runmake ${TFA_BUILD_TARGET}
>  }
>  
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
> index e8933fb..4d41202 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
> @@ -1,6 +1,9 @@
>  #
>  # Trusted firmware-A 2.1
>  #
> +
> +require trusted-firmware-a.inc
> +
>  SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
>  
>  # Use TF-A for version
> @@ -33,20 +36,3 @@ LIC_FILES_CHKSUM_MBEDTLS += " \
>  
>  SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
>  SRC_URI[mbedtls.sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
> -
> -require trusted-firmware-a.inc
> -
> -# The following hack is needed to fit properly in yocto build environment
> -# TFA is forcing the host compiler and its flags in the Makefile using :=
> -# assignment for GCC and CFLAGS.
> -# To properly use the native toolchain of yocto and the right libraries we need
> -# to pass the proper flags to gcc. This is achieved here by creating a gcc
> -# script to force passing to gcc the right CFLAGS and LDFLAGS
> -do_compile_prepend() {
> -    #Create an host gcc build parser to ensure the proper include path is used
> -    mkdir -p bin
> -    echo "#!/usr/bin/env bash" > bin/gcc
> -    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \$@" >> bin/gcc
> -    chmod a+x bin/gcc
> -    export PATH="$PWD/bin:$PATH"
> -}
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
> new file mode 100644
> index 0000000..4d5316e
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
> @@ -0,0 +1,38 @@
> +#
> +# Trusted firmware-A 2.2
> +#
> +
> +require trusted-firmware-a.inc
> +
> +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
> +
> +# Use TF-A for version
> +SRCREV_FORMAT = "tfa"
> +
> +# TF-A v2.2
> +SRCREV_tfa = "7192b956bde11652a835eee0724dca0e403fee90"
> +
> +S = "${WORKDIR}/git"
> +
> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> +
> +SRC_URI[tfa.md5sum] = "75c8f4958fb493d9bd7a8e5a9636ec18"
> +SRC_URI[tfa.sha256sum] = "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
> +
> +#
> +# mbed TLS source
> +# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
> +#
> +
> +SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
> +
> +# mbed TLS v2.16.2
> +SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
> +
> +LIC_FILES_CHKSUM_MBEDTLS += " \
> +    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
> +    "
> +
> +SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
> +SRC_URI[mbedtls.sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> new file mode 100644
> index 0000000..bfda87b
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> @@ -0,0 +1,38 @@
> +#
> +# Trusted firmware-A 2.3
> +#
> +
> +require trusted-firmware-a.inc
> +
> +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
> +
> +# Use TF-A for version
> +SRCREV_FORMAT = "tfa"
> +
> +# TF-A v2.3
> +SRCREV_tfa = "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
> +
> +S = "${WORKDIR}/git"
> +
> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> +
> +SRC_URI[tfa.md5sum] = "75c8f4958fb493d9bd7a8e5a9636ec18"
> +SRC_URI[tfa.sha256sum] = "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
> +
> +#
> +# mbed TLS source
> +# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
> +#
> +
> +SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
> +
> +# mbed TLS v2.18.1
> +SRCREV_mbedtls = "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
> +
> +LIC_FILES_CHKSUM_MBEDTLS += " \
> +    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
> +    "
> +
> +SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
> +SRC_URI[mbedtls.sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
> index 4bf3ae5..c443ecd 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
> @@ -9,30 +9,23 @@ DEFAULT_PREFERENCE = "-1"
>  require trusted-firmware-a.inc
>  
>  SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
> +
> +# Use TF-A for version
>  SRCREV_FORMAT = "tfa"
> -LIC_FILES_CHKSUM ?= "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
>  
> +S = "${WORKDIR}/git"
> +
> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> +
> +#
>  # mbed TLS source
>  # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
> +#
> +
>  SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
> -LIC_FILES_CHKSUM_MBEDTLS ?= " \
> +
> +LIC_FILES_CHKSUM_MBEDTLS += " \
>      file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>      file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
>      "
>  
> -S = "${WORKDIR}/git"
> -
> -# The following hack is needed to fit properly in yocto build environment
> -# TFA is forcing the host compiler and its flags in the Makefile using :=
> -# assignment for GCC and CFLAGS.
> -# To properly use the native toolchain of yocto and the right libraries we need
> -# to pass the proper flags to gcc. This is achieved here by creating a gcc
> -# script to force passing to gcc the right CFLAGS and LDFLAGS
> -do_compile_prepend() {
> -    # Create an host gcc build parser to ensure the proper include path is used
> -    mkdir -p bin
> -    echo "#!/usr/bin/env bash" > bin/gcc
> -    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \$@" >> bin/gcc
> -    chmod a+x bin/gcc
> -    export PATH="$PWD/bin:$PATH"
> -}
> -- 
> 2.17.1
> 

> 

