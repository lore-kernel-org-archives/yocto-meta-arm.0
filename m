Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1862.1624820935176172402
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 27 Jun 2021 12:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 437C040C8F;
	Sun, 27 Jun 2021 19:08:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CV9ZWmlx25Na; Sun, 27 Jun 2021 19:08:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 11D9E40BEB;
	Sun, 27 Jun 2021 19:08:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 69BD917461A; Sun, 27 Jun 2021 15:08:50 -0400 (EDT)
Date: Sun, 27 Jun 2021 15:08:50 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [meta-arm] [PATCH] gator-daemon: Do not specify header files in GATORD_CXX_SRC_FILES
Message-ID: <20210627190850.GV1528@denix.org>
References: <20210626212806.1956740-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210626212806.1956740-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 26, 2021 at 02:28:06PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Jon Mason <jon.mason@arm.com>
> Cc: Ross Burton <ross.burton@arm.com>
> ---
>  ...e-xml-PmuXMLParser.h-header-from-GAT.patch | 31 +++++++++++++++++++
>  .../gator-daemon/gator-daemon_7.7.0.bb        |  4 ++-
>  2 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
> 
> diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
> new file mode 100644
> index 0000000..fc39f4e
> --- /dev/null
> +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
> @@ -0,0 +1,31 @@
> +From 6f62c77f0a51de17b7f81f225ef483ed8214640e Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 26 Jun 2021 14:19:10 -0700
> +Subject: [PATCH] Sources.mk: Remove xml/PmuXMLParser.h header from
> + GATORD_CXX_SRC_FILES
> +
> +This otherwise appears in final linker cmdline and clang is not happy
> +since it sees this as an output file along with the real output file
> +specified with -o and bails out
> +
> +| clang-13: error: cannot specify -o when generating multiple output files
> +

Upstream-Status?


> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + daemon/Sources.mk | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/daemon/Sources.mk b/daemon/Sources.mk
> +index 60d15ef..3e679f5 100644
> +--- a/daemon/Sources.mk
> ++++ b/daemon/Sources.mk
> +@@ -147,5 +147,4 @@ GATORD_CXX_SRC_FILES := \
> +     xml/EventsXMLProcessor.cpp \
> +     xml/MxmlUtils.cpp \
> +     xml/PmuXML.cpp \
> +-    xml/PmuXMLParser.cpp \
> +-    xml/PmuXMLParser.h
> ++    xml/PmuXMLParser.cpp
> +-- 
> +2.32.0
> +
> diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> index 61b1731..b3ba437 100644
> --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> @@ -16,7 +16,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                     "
>  
>  SRCREV = "9d8d75fa08352470c51abc23fe3b314879bd8b78"
> -SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main"
> +SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main \
> +           file://0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch;striplevel=2 \
> +          "
>  
>  S = "${WORKDIR}/git/daemon"
>  
> -- 
> 2.32.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
