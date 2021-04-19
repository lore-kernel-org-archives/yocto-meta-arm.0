Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.1139.1618850065356712183
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 09:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=cgM1ifKc;
 spf=pass (domain: burtonini.com, ip: 209.85.221.46, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f46.google.com with SMTP id e5so6053312wrg.7
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Apr 2021 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7eaVLb60g4pyih9ba2ojjMTa3R/+R0JEXqZVsqazx4c=;
        b=cgM1ifKcuTxdGzKVldJpJNjgSFpg0zJW8Zi2pfEtGOOSYLBqNWys5fOmbovhdvSLMB
         xWA8lVdUy8R0hqjCS+0GOLQx5hwb+4QTkViiiq79J8fIauGdKaI2Cycbb9LkquL6N8nv
         Rq36q8xH8v2UI5V+bTV/DtVdXYEutFl4yWejEqhwujnKaqaEhQiPAUiy9Sdw28rkoWKw
         0eb2BTWD3Lwh+seTAk6yNO0keOsZ2wt0fQBa+bms9W2qmnaIg5+EhpHvs9Vi+UMWyCdm
         2CwzNUX65nYCbDssXMzlxu5FEr/tOc+GeNG2/vktrYDhEh9gCAS2inOpysivExErPCP/
         IBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7eaVLb60g4pyih9ba2ojjMTa3R/+R0JEXqZVsqazx4c=;
        b=a6d42Z7ETX9/v7CcZ9wlRfxCrFvw+KvKBXHEDzow7vBayp00mtVR0ARwDiwxa4fC7B
         nOGHAJfqLbz27WlNK5zwA/FoIrGXSnA5IS4K/zMvDpLTgsMxVKjTdeW9aW1dv20vyzz0
         DBKbYp/qme30qSgnKxSRK6EZk13k0s4abXlK7vFSVU9kJO9qDCvL7QrZ2/W4neoPz24/
         EWmj0Yy370z8yAQ8TUM+A52Y4M79Y+ZjpIX0lcfLnDzKQcpv02otXPMvxnMo+UD4YkRN
         ld0Usc24AIN1Q5p9R7k9A4uQDR+I1a8nngIdrMkOX6FdlTrxoihgia2QBbqtPLyc+uI+
         L2mQ==
X-Gm-Message-State: AOAM532Ibk73TenpF9qSje66jI8oUmUWsnL0ka20KTokpMm9DmgfKAiE
	QnjzIb2p0wm7DFSksrES8dxPJZsi7FI351UQkYhCcg==
X-Google-Smtp-Source: ABdhPJydl7lRCscaA0dGpF6UwS77iYoBVNr4JeHN19tLUjIqTVhme1EEYSjqgv5T90RtBA2hxOnRY0JMtLnzL4q5oAQ=
X-Received: by 2002:a5d:4707:: with SMTP id y7mr15983536wrq.396.1618850063875;
 Mon, 19 Apr 2021 09:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210414134726.4125294-1-yann@blade-group.com> <20210414134726.4125294-4-yann@blade-group.com>
In-Reply-To: <20210414134726.4125294-4-yann@blade-group.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 19 Apr 2021 17:34:13 +0100
Message-ID: <CAAnfSTumRh_EaePZpxccodTmtTO=M0BqLHzfZn78iZXpVjhT=Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2 3/6] arm/optee-os: deploy tee.elf for u-boot
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: meta-arm@lists.yoctoproject.org, Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"

This is causing the CI to break:

ERROR: optee-os-3.11.0-r0 do_package_qa: QA Issue: optee-os: ELF
binary /lib/firmware/tee.elf has relocations in .text [textrel]

Can you either fix or add an INSANE_SKIP with a comment?

Ross

On Wed, 14 Apr 2021 at 14:48, Yann Dirson <yann.dirson@blade-group.com> wrote:
>
> From: Yann Dirson <yann@blade-group.com>
>
> Integration of OP-TEE in the u-boot image is done with `TEE=tee.elf`,
> so this build artifact must be exported.
>
> U-boot integration can now be done in a BSP layer with something like
> this in `u-boot_%.bbappend`:
>
>  # OP-TEE, dependent on "optee" DISTRO_FEATURES
>
>  OPTEE_OEMAKE ?= " TEE=${DEPLOY_DIR_IMAGE}/optee/tee.elf"
>
>  EXTRA_OEMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
>  PACKAGECONFIG[optee] = "${OPTEE_OEMAKE},,optee-os"
>  PACKAGECONFIG_append = " ${@bb.utils.filter('DISTRO_FEATURES', 'optee', d)}"
>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  meta-arm/recipes-security/optee/optee-os.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> index 34f586a..08cc2f0 100644
> --- a/meta-arm/recipes-security/optee/optee-os.inc
> +++ b/meta-arm/recipes-security/optee/optee-os.inc
> @@ -45,7 +45,7 @@ do_compile[cleandirs] = "${B}"
>  do_install() {
>      #install core in firmware
>      install -d ${D}${nonarch_base_libdir}/firmware/
> -    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
> +    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
>
>      #install TA devkit
>      install -d ${D}${includedir}/optee/export-user_ta/
> --
> 2.30.2
>
>
> 
>
