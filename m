Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.507.1584648969063578036
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Mar 2020 13:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=iL39TAd2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id l13so3035264qtv.10
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2020 13:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ynATPdaCTcMs6PPydxuPUxz49INIy74/j6TWnuaUmrI=;
        b=iL39TAd2B4DYAE/T1m2jbrlQlxiEyouU6LTqXjAgO7LHzynIQlnCMV+s7Trjw74FFh
         EiCSRlcnBcBtwrQOnB2Im/4yFTjF9G95Kdh6gRHjAyFW234fLq+UVaG3KlYmJf+nCw3u
         c4hlOQJwN//WjWRm9h2PKPWQA/LdYZWQkyJfKnDsqfUSWHy6APrq5c9tYrlcZ+CMpoEO
         f9H4DcirGVMgELbEwdkbhKK+O+4oPiWHaUixAWRRBlherPKlttrwwSvauQIAT4EsbjXM
         48chgMGnT1yWRHp5OAJ1c3gvFEAPt5BgllgkZC13ZHrg3gy3LaN80aBmGd8fDtHHbgSE
         QNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ynATPdaCTcMs6PPydxuPUxz49INIy74/j6TWnuaUmrI=;
        b=ETObBo/sSXU1D8Ham8X4rckrwOqPLaQOnA3yXLc/z0tm+i0ayG1F9zymBi3RDRugEY
         bRdvgGmdlk+wzhWjSSXbvD+ThwCBrNMcsFh5uvN0D/GNQNwA/p1pYbzATuMspQAmC08E
         Jl3UR2SZzEF2t8I7tTQAYZbr6mRcUiZK5f1kTRlMMcHZCIf6tHKt8ZxDfrkK0jw6oQSH
         l/CFjpNvpoRsGAHfmQgZ78jJthJT2crI3MfeDT2/Wbz+ML2DBRYtXm/kbvczrj4I1LRw
         uOpF4A4H4AXzhqccLrOIdar4Tpf2xvDARuU6eY+ws9CevG5V7E4sfKst3gXgO8Tyd4uG
         SDVA==
X-Gm-Message-State: ANhLgQ0prKYE8mAs73muDlXOamrgcLfjAkw9iyfXJxmMYpEQXk8Nt/mL
	nsce9vmY6CXIpny9WpqkJbbABALumSB3hA==
X-Google-Smtp-Source: ADFU+vt/jZ+qLmGGMZ8AEbwwv1pLnHpyJ1pkEMJAsUi112dchLpMTIpml5M13d9U4/RPJqSJBXYdoQ==
X-Received: by 2002:ac8:4602:: with SMTP id p2mr4979990qtn.220.1584648967883;
        Thu, 19 Mar 2020 13:16:07 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:4158:6bf7:f564:e8f1])
        by smtp.gmail.com with ESMTPSA id t23sm2558039qtj.63.2020.03.19.13.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 13:16:07 -0700 (PDT)
Date: Thu, 19 Mar 2020 16:16:05 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com, Diego Sueiro <diego.sueiro@arm.com>
Subject: Re: [meta-arm] [PATCH] meta-arm-bsp:linux-linaro-arm: Fix kernel menuconfig task
Message-ID: <20200319201605.GA27467@kudzu.us>
References: <1583742455-36755-1-git-send-email-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <1583742455-36755-1-git-send-email-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2020 at 08:27:35AM +0000, Diego Sueiro wrote:
> When calling `bitbake virtual/kernel -c menuconfig` it fails if the
> ncurses-dev package is not installed on the host machine.
> 
> This patch makes usage of the ncurses library built by yocto if it
> is present.
> 
> Change-Id: I6a8c4ca6a7da07ac834b29a2d23e83e6c153efb3
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Applied to the master branch of meta-arm.

Thanks,
Jon

> ---
>  ...g-Allow-specification-of-ncurses-location.patch | 52 ++++++++++++++++++++++
>  .../recipes-kernel/linux/linux-linaro-arm_4.19.bb  |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch b/meta-arm-bsp/recipes-kernel/linux/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
> new file mode 100644
> index 0000000..372d0af
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
> @@ -0,0 +1,52 @@
> +rom d078e29aa31ac3fa4c041bf89c46bc6372c1a02a Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@windriver.com>
> +Date: Mon, 2 Jul 2018 23:10:28 -0400
> +Subject: menuconfig,mconf-cfg: Allow specification of ncurses location
> +
> +In some cross build environments such as the Yocto Project build
> +environment it provides an ncurses library that is compiled
> +differently than the host's version.  This causes display corruption
> +problems when the host's curses includes are used instead of the
> +includes from the provided compiler are overridden.  There is a second
> +case where there is no curses libraries at all on the host system and
> +menuconfig will just fail entirely.
> +
> +The solution is simply to allow an override variable in
> +check-lxdialog.sh for environments such as the Yocto Project.  Adding
> +a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
> +compiling and linking against the right headers and libraries.
> +
> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> +cc: Michal Marek <mmarek@suse.cz>
> +cc: linux-kbuild@vger.kernel.org
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +---
> + scripts/kconfig/mconf-cfg.sh | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> + mode change 100755 => 100644 scripts/kconfig/mconf-cfg.sh
> +
> +(limited to 'scripts/kconfig/mconf-cfg.sh')
> +
> +diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> +old mode 100755
> +new mode 100644
> +index c812872d7f9d..65a9b9e5b8a6
> +--- a/scripts/kconfig/mconf-cfg.sh
> ++++ b/scripts/kconfig/mconf-cfg.sh
> +@@ -4,6 +4,14 @@
> + PKG="ncursesw"
> + PKG2="ncurses"
> + 
> ++if [ "$CROSS_CURSES_LIB" != "" ]; then
> ++    echo libs=\'$CROSS_CURSES_LIB\'
> ++    if [ x"$CROSS_CURSES_INC" != x ]; then
> ++	echo cflags=\'$CROSS_CURSES_INC\'
> ++    fi
> ++    exit 0
> ++fi
> ++
> + if [ -n "$(command -v pkg-config)" ]; then
> + 	if pkg-config --exists $PKG; then
> + 		echo cflags=\"$(pkg-config --cflags $PKG)\"
> +-- 
> +cgit v1.2.2-1-g5e49
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
> index 496f491..089f6cb 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
> @@ -11,6 +11,7 @@ SRCREV_meta ?= "ad6f8b357720ca8167a090713b7746230cf4b314"
>  
>  SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;name=machine;branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
> +           file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
>            "
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> -- 
> 2.7.4
> 

> 

