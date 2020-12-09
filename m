Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.8438.1607527989667914135
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Dec 2020 07:33:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=eISbK+oV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id 1so1573571qka.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Dec 2020 07:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2d+cusSC/a61ue9NR2IP8oHXVcEzLlZmd13oLgyWCC8=;
        b=eISbK+oV/dhmTQ0d44r5qtacZDo+p0UAa4TlvoL8WitGHUMg7wNv3sm1I+2uz8gfEd
         hbMCivqKZnnooXrEU1CIWHirY+f3qMagEZQTSbTwqn+rE+0wR1zhTxavvZIItil8Q9tJ
         OpPltGFqMlqcHly9PwEpn7iSrIz77KUQWm8pH4h7Pqrwn77T21CEvLVaMB+OrXg4yPOt
         Pi0glvVVvb+LpxaHRUn8z7mVqSqN+6IBkfTbDJ7XcvJp81LaoBQNgZ9gjD/DQ6zhpqId
         FY6ESY2EL9xfL1xQGgVxOFMgl0CCZw3hNtbbJ5AkniAJX9G0VKbZHcBWxDGL7vQ89uD9
         qWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2d+cusSC/a61ue9NR2IP8oHXVcEzLlZmd13oLgyWCC8=;
        b=mTSPjGeBdxyVj0xwcwiJMhSl4DfRRwomgNHVzy4vmNddTOByTt6OyTv/xW7JO2368q
         3EZpuntrKO7gJ4vvFrpuqtJaBofZQXPWFaiWqQdPh1Hg7Byt18rCnZL9qJGQN7Hq9NBO
         8xbc9D6j1ygI5NYvTfThfvDk/F2j95eS6qbHq5kSDwhNqBlgGQ6KZzOS99RbLwJm01ES
         m4/bQ1i6z9TQlJNShC/PY3VN/SLKrdvLcFDLdlnXFwFgh04Z7pI+Q3cFeeBJ+Mwnhtvc
         KEHnNCxea4Xh4JcxKInj6atxXiBBANPTvKz+x8qm7fXlxCx15xi6eChK6C6Tg0RlheFJ
         TMjg==
X-Gm-Message-State: AOAM532PDn01LbLoRgc9nLd06+RDfQfT5xkNNzg6Krbf2pppZ19yEp7i
	EboQRruBs/KC2NzSkXPFQBOPWg==
X-Google-Smtp-Source: ABdhPJx+myzSw0TeC4fpmH0VbT1ikaQF2CHyL71aiuZpg0nbLCh3sre8mgpPL+WuyTIwDJEQTFUkAw==
X-Received: by 2002:a37:6f04:: with SMTP id k4mr3809431qkc.426.1607527988856;
        Wed, 09 Dec 2020 07:33:08 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:a12d:9189:5829:3da3])
        by smtp.gmail.com with ESMTPSA id 74sm1207385qko.59.2020.12.09.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:33:07 -0800 (PST)
Date: Wed, 9 Dec 2020 10:33:06 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy/modutils-initscripts: Revert fix modules.dep update
Message-ID: <20201209153305.GD12460@kudzu.us>
References: <2584bb9172dd000f8162f27be6a90c9f2a5147e2.1607436255.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <2584bb9172dd000f8162f27be6a90c9f2a5147e2.1607436255.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 08, 2020 at 02:05:29PM +0000, Diego Sueiro wrote:
> This reverts commit 9872afc6c7de4f2d83a11ab4cf57593b0b02661d.
> 
> The fix was merged in oe-core as: 572f3045faa0a937947fbd56bcfef7bad55e9da6
> 
> Change-Id: Ib9531c1d18ac743c063afe66de18015472cdbb3d
> Issue-Id: SCM-1520
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Both patches applied to master.

Thanks,
Jon

> ---
>  .../modutils-initscripts.bbappend             |  4 ---
>  .../fix-modules-dep-creation.patch            | 33 -------------------
>  2 files changed, 37 deletions(-)
>  delete mode 100644 meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch
> 
> diff --git a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
> index 6cd3e17..2a2fd20 100644
> --- a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
> +++ b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
> @@ -1,6 +1,2 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI_append = " file://fix-modules-dep-creation.patch"
> -
>  # We want to have modutils.sh running after checkroot.sh (05)
>  INITSCRIPT_PARAMS = "start 06 S ."
> diff --git a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch
> deleted file mode 100644
> index c9a7c1f..0000000
> --- a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -When building an image with USE_DEPMOD="0" we expect that on the first boot the
> -modutils.sh initscript to create the modules.dep file if it is empty or not
> -present.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> -
> -diff --git a/modutils.sh b/modutils.sh
> -index a78adf5729..4afd12a9fe 100755
> ---- a/modutils.sh
> -+++ b/modutils.sh
> -@@ -13,14 +13,17 @@
> - 
> - LOAD_MODULE=modprobe
> - [ -f /proc/modules ] || exit 0
> --[ -f /etc/modules ] || [ -d /etc/modules-load.d ] || exit 0
> --[ -e /sbin/modprobe ] || LOAD_MODULE=insmod
> - 
> --if [ ! -f /lib/modules/`uname -r`/modules.dep ]; then
> -+# Test if modules.dep exists and has a size greater than zero
> -+if [ ! -s /lib/modules/`uname -r`/modules.dep ]; then
> - 	[ "$VERBOSE" != no ] && echo "Calculating module dependencies ..."
> --	depmod -Ae
> -+	depmod -ae
> - fi
> - 
> -+[ -f /etc/modules ] || [ -d /etc/modules-load.d ] || exit 0
> -+[ -e /sbin/modprobe ] || LOAD_MODULE=insmod
> -+
> -+
> - loaded_modules=" "
> - 
> - process_file() {
> -- 
> 2.17.1
> 

> 
> 
> 

