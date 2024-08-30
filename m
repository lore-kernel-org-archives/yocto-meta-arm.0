Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E30CA0FFB
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 14:17:59 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.16681.1725027470410006507
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 07:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0iuJSuMI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.44, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5daa93677e1so1056609eaf.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725027469; x=1725632269; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IqH7L45cjRjgWe5OC3X7CNWm6JXsKIza49zEGkXFHrg=;
        b=0iuJSuMI+KuvRSq0E3kcAF/fCGg9xI1efb91KAoR9yNp0M7Zim18mfKoP3/xvemXeR
         Fwf6ghPFzmyvHcWAdMYZ9/A5flWX7pBsEn618rOmNGFEJOrY+5Gr45TlmgezAQEq9+cl
         Bu6MMj6cDqQsAQg+lmLqgwrHa1fOZq2R7/yIOMZKj9R1NGbzLeTworIvb54nBVS2chX0
         5EoBSefgL7k/3xCcU/TdTU9lVTVCa14MOOQRuWXH+FQlW/f6U4UK59dh2nqWfM1UCVdY
         MHTGzSEmtbRMu6UWq/bhK8IZH6VWzfZ0chog89UZWcZHaKHtjTIc7b2Hu1StmxLT0AeL
         oBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027469; x=1725632269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqH7L45cjRjgWe5OC3X7CNWm6JXsKIza49zEGkXFHrg=;
        b=RRUv3pZq09EnRPCwBtNLrKW7WhKmRsIll+D91mp5ShtDCKwMlTMSK+8e4eprTXI5UN
         mfIp62/KH+/xRA2ei9MTE3v+ukQU85BAE0YYaYSLYMcRLvH+7TU/k1FGhmtMcaixEc15
         G8w/405mlLo6RlEpzQ3tZsAdEy2/L3pQ/S1iqyH2I+SCzLpxDdiIpm2HMscm5Bt6mhmy
         Iqu7onhYfgziuFzBJzo4R2/pU5o2Jx5jfb1k3346yQsu7dwCtz29maU3ygrCiuno7TGq
         A9P3ZbK5kAAoSaIm5RE0DUWCcpo1GeTj5wGYMAnScSTGsVCYJNYxlS36WpZPOsHQvzoM
         Gklg==
X-Gm-Message-State: AOJu0YyHZHVP55gCw1LN6efjuqWkEv6RJowzJazNgd+Oqy23UwifzYyy
	mRTMMwftGrlY39tA/Fc0ycQmIVuVRhO9uPuwC0bnNcEUu1ZiCF01/hBkck6ORw==
X-Google-Smtp-Source: AGHT+IHZjbDV6wFg/LnwS5dN4B0IwakHyhcM73LVSheh8I+2aYsIJ+kSvMeAMTPiq3fCzWqS1hbXfg==
X-Received: by 2002:a05:6358:52c3:b0:1b1:acd5:dd98 with SMTP id e5c5f4694b2df-1b603c0b617mr836408355d.7.1725027469378;
        Fri, 30 Aug 2024 07:17:49 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340daf160sm14854666d6.137.2024.08.30.07.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:17:48 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:17:47 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 07/13] meta-arm: Introduce gen-uefi-sb-keys.bb recipe
Message-ID: <ZtHUi14mYKJ1M76X@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-8-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829163209.47945-8-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 14:17:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6033

On Thu, Aug 29, 2024 at 10:32:03AM -0600, Javier Tia wrote:
> Generate a new set of keys on build time. It avoids to use same keys
> which could generate a security issue.

Squash with patch #3 and #4

> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb | 26 +++++++++
>  meta-arm/uefi-sb-keys/.gitignore              |  4 ++
>  meta-arm/uefi-sb-keys/gen_uefi_keys.sh        | 56 +++++++++----------
>  3 files changed, 57 insertions(+), 29 deletions(-)
>  create mode 100644 meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb
>  create mode 100644 meta-arm/uefi-sb-keys/.gitignore
> 
> diff --git a/meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb b/meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb
> new file mode 100644
> index 00000000..a4ae6d87
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: MIT
> +
> +SUMMARY = "Generate UEFI keys for secure boot"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +DEPENDS += "bash-native"
> +DEPENDS += "coreutils-native"
> +DEPENDS += "efitools-native"
> +DEPENDS += "openssl-native"
> +
> +SRC_URI = "file://${UEFI_SB_KEYS_DIR}/gen_uefi_keys.sh"
> +
> +UNPACKDIR = "${S}"
> +
> +do_fetch[noexec] = "1"
> +do_patch[noexec] = "1"
> +do_compile[noexec] = "1"
> +do_configure[noexec] = "1"
> +
> +do_install() {
> +    ${UEFI_SB_KEYS_DIR}/gen_uefi_keys.sh ${UEFI_SB_KEYS_DIR}
> +}
> +
> +FILES:${PN} = "${UEFI_SB_KEYS_DIR}/*.key"
> +FILES:${PN} += "${UEFI_SB_KEYS_DIR}/*.crt"
> diff --git a/meta-arm/uefi-sb-keys/.gitignore b/meta-arm/uefi-sb-keys/.gitignore
> new file mode 100644
> index 00000000..f8669919
> --- /dev/null
> +++ b/meta-arm/uefi-sb-keys/.gitignore
> @@ -0,0 +1,4 @@
> +*.auth
> +*.crt
> +*.esl
> +*.key
> \ No newline at end of file
> diff --git a/meta-arm/uefi-sb-keys/gen_uefi_keys.sh b/meta-arm/uefi-sb-keys/gen_uefi_keys.sh
> index fc7f25c9..21e65c72 100755
> --- a/meta-arm/uefi-sb-keys/gen_uefi_keys.sh
> +++ b/meta-arm/uefi-sb-keys/gen_uefi_keys.sh
> @@ -1,35 +1,33 @@
> -#/bin/sh
> +#!/bin/bash
> +#
> +# SPDX-License-Identifier: MIT
> +#
>  
>  set -eux
>  
> -#Create PK
> -openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=Linaro_LEDGE/ -keyout PK.key -out PK.crt -nodes -days 3650
> -cert-to-efi-sig-list -g 11111111-2222-3333-4444-123456789abc PK.crt PK.esl
> -sign-efi-sig-list -c PK.crt -k PK.key PK PK.esl PK.auth
> +KEYS_PATH=${1:-./}
> +SUBJECT="/CN=Linaro_LEDGE/"
> +GUID="11111111-2222-3333-4444-123456789abc"
>  
> -#Create KEK
> -openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=Linaro_LEDGE/ -keyout KEK.key -out KEK.crt -nodes -days 3650
> -cert-to-efi-sig-list -g 11111111-2222-3333-4444-123456789abc KEK.crt KEK.esl
> -sign-efi-sig-list -c PK.crt -k PK.key KEK KEK.esl KEK.auth
> +openssl req -x509 -sha256 -newkey rsa:2048 -subj "${SUBJECT}" \
> +    -keyout "${KEYS_PATH}"/PK.key -out "${KEYS_PATH}"/PK.crt \
> +    -nodes -days 3650
> +cert-to-efi-sig-list -g ${GUID} \
> +    "${KEYS_PATH}"/PK.crt "${KEYS_PATH}"/PK.esl
> +sign-efi-sig-list -c "${KEYS_PATH}"/PK.crt -k "${KEYS_PATH}"/PK.key \
> +    "${KEYS_PATH}"/PK "${KEYS_PATH}"/PK.esl "${KEYS_PATH}"/PK.auth
>  
> -#Create DB
> -openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=Linaro_LEDGE/ -keyout db.key -out db.crt -nodes -days 3650
> -cert-to-efi-sig-list -g 11111111-2222-3333-4444-123456789abc db.crt db.esl
> -sign-efi-sig-list -c KEK.crt -k KEK.key db db.esl db.auth
> -
> -#Create DBX
> -openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=Linaro_LEDGE/ -keyout dbx.key -out dbx.crt -nodes -days 3650
> -cert-to-efi-sig-list -g 11111111-2222-3333-4444-123456789abc dbx.crt dbx.esl
> -sign-efi-sig-list -c KEK.crt -k KEK.key dbx dbx.esl dbx.auth
> -
> -#Sign image
> -#sbsign --key db.key --cert db.crt Image
> -
> -#Digest image
> -#hash-to-efi-sig-list Image db_Image.hash
> -#sign-efi-sig-list -c KEK.crt -k KEK.key db db_Image.hash db_Image.auth
> -
> -#Empty cert for testing
> -touch noPK.esl
> -sign-efi-sig-list -c PK.crt -k PK.key PK noPK.esl noPK.auth
> +for key in KEK db dbx; do
> +    openssl req -x509 -sha256 -newkey rsa:2048 -subj "${SUBJECT}" \
> +        -keyout "${KEYS_PATH}"/${key}.key -out "${KEYS_PATH}"/${key}.crt \
> +        -nodes -days 3650
> +    cert-to-efi-sig-list -g ${GUID} \
> +        "${KEYS_PATH}"/${key}.crt "${KEYS_PATH}"/${key}.esl
> +    sign-efi-sig-list -c "${KEYS_PATH}"/PK.crt -k "${KEYS_PATH}"/PK.key \
> +        "${KEYS_PATH}"/${key} "${KEYS_PATH}"/${key}.esl "${KEYS_PATH}"/${key}.auth
> +done
>  
> +# Empty cert for testing
> +touch "${KEYS_PATH}"/noPK.esl
> +sign-efi-sig-list -c "${KEYS_PATH}"/PK.crt -k "${KEYS_PATH}"/PK.key \
> +    "${KEYS_PATH}"/PK "${KEYS_PATH}"/noPK.esl "${KEYS_PATH}"/noPK.auth
> -- 
> 2.46.0
> 
> 

