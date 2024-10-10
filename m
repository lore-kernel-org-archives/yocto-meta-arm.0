Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D89CFC5EC
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 17:55:52 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web11.50855.1728582945259801262
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 10:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mskkGg8M;
 spf=pass (domain: linaro.org, ip: 209.85.221.173, mailfrom: javier.tia@linaro.org)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-50792ed3ad9so389018e0c.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 10 Oct 2024 10:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728582944; x=1729187744; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf9vocnVMQXaJ31l50QMcNOaFi9bpAtZqyrEKfVIs5Y=;
        b=mskkGg8MfiZ4+/Tntz7/vTCYLv6jxG0/8Ul6HZS2lLHxtMNru78eEVVOTZYRJlrYTE
         WJd2AmDLvdDoNREf5mHeVjO68ya2ME+cZCvs+uZF0RyRA+rRz6i9NeLk2axawZtHkmGR
         toEQNRf9otXKXNa+ScZZjtzeXH2nSY2AvM223LOrJziDUQleLOP7HjIFV/zn8QlDJ/5P
         wrOyBNDBNx5/Gj+uS03vtyAE8VUfzQe5agJRmqCiq16l4GsFjAyKrl0nCygipXdfAGqD
         lKj+e4Utiaug3B5fZLWWaFrpYjDrxAIYrfBGZtLbU4ZnwTlOePtsUh1RnpSwnuhMx73h
         aVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728582944; x=1729187744;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rf9vocnVMQXaJ31l50QMcNOaFi9bpAtZqyrEKfVIs5Y=;
        b=hDT3aThscIVH7L8v13pI0BUGESMjTbdltSwbQN4CYoAodQayBPEnPL41GAU9vzq/gT
         i+PX14KL7dTk3rxNVUdYaOfFmx3A5EmIbrJ3I86NunC/EzQD3ENuTFv4b0yalNXmr/MN
         HFXTbAgw/cG0ALNqFFRkxhAb5dZhLdFb9AkuawPKX8nKwe8RYtJOYTpx+SdNm2xbfsSN
         28i8pnzT9fUUOWdTeJgp2n86AEWWn6ghHot8sN0fph11heUDocUvAZrCYkgv56iUiIXg
         Z/lVsJSESPwSdLXY1nq/2B8maM84AHfUix0HuUZ7+HNLqSeS1LxaVZfv6l6JbO2DMQus
         mZ7g==
X-Gm-Message-State: AOJu0YyO2RVjxeQS46fCYvD4udSKl+Y9Gw0BfYKE1ZuXsAhK6A9acmIP
	6JCeEckzo73W3NInP5tz3vscYLXHtVdLSYlRFLSs+b1jBousopGshRBA/GT5F5qmEC5MZUsbLtO
	n
X-Google-Smtp-Source: AGHT+IFHHhIHGE50r1uENDxEPhH8SLyGwbpBQWdXYgTpw+zdSRXo788mLo9K/GaBN6aKpHzHjFZ52A==
X-Received: by 2002:a05:6122:179b:b0:50a:c02e:788d with SMTP id 71dfb90a1353d-50d17dace30mr331288e0c.7.1728582943797;
        Thu, 10 Oct 2024 10:55:43 -0700 (PDT)
Received: from [192.168.8.164] ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-50d08852f16sm234726e0c.40.2024.10.10.10.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 10:55:43 -0700 (PDT)
Message-ID: <886cc220-c206-4f66-b9d4-79d674a00f0b@linaro.org>
Date: Thu, 10 Oct 2024 11:55:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0] arm/uefi-secureboot: Add uefi capsule update support
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Ross Burton
 <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
References: <20241008002221.261923-1-javier.tia@linaro.org>
From: Javier Tia <javier.tia@linaro.org>
Content-Language: en-US, es-MX
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <20241008002221.261923-1-javier.tia@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Oct 2024 17:55:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6186

Hi,

Reviving this patch in case it has been lost under the cracks. A copy at:

https://lore.kernel.org/yocto-meta-arm/20241008002221.261923-1-javier.tia@linaro.org/T/#u

Thanks,

On 10/7/24 6:22 PM, Javier Tia wrote:
> UEFI capsule update is a mechanism that allows firmware updates to be
> delivered and applied in a standardized way. It is part of the UEFI
> specification and provides a way to update system firmware components
> like the BIOS, UEFI drivers, or other platform firmware.
> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>   ci/uefi-secureboot.yml                                     | 4 ++--
>   meta-arm/recipes-bsp/u-boot/u-boot-uefi-capsule-update.inc | 3 +++
>   meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc     | 1 +
>   meta-arm/recipes-bsp/u-boot/u-boot/uefi-capsule-update.cfg | 5 +++++
>   4 files changed, 11 insertions(+), 2 deletions(-)
>   create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot-uefi-capsule-update.inc
>   create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/uefi-capsule-update.cfg
> 
> diff --git a/ci/uefi-secureboot.yml b/ci/uefi-secureboot.yml
> index 4e9572cc..e8aa6004 100644
> --- a/ci/uefi-secureboot.yml
> +++ b/ci/uefi-secureboot.yml
> @@ -23,7 +23,7 @@ local_conf_header:
>       WKS_FILE = "efi-disk.wks.in"
>       KERNEL_IMAGETYPE = "Image"
>   
> -    MACHINE_FEATURES:append = " efi uefi-secureboot uefi-http-boot"
> +    MACHINE_FEATURES:append = " efi uefi-secureboot uefi-http-boot uefi-capsule-updates"
>   
>       EFI_PROVIDER = "systemd-boot"
>   
> @@ -34,4 +34,4 @@ local_conf_header:
>   
>       IMAGE_INSTALL:append = " systemd systemd-boot util-linux coreutils"
>   
> -    TEST_SUITES:append = " uefi_secureboot"
> \ No newline at end of file
> +    TEST_SUITES:append = " uefi_secureboot"
> diff --git a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-capsule-update.inc b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-capsule-update.inc
> new file mode 100644
> index 00000000..6b6913ad
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-capsule-update.inc
> @@ -0,0 +1,3 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += "file://uefi-capsule-update.cfg"
> diff --git a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
> index 48c2de86..cb2fed15 100644
> --- a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
> +++ b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
> @@ -5,6 +5,7 @@ SRC_URI += "file://uefi-secureboot.cfg"
>   inherit sbsign
>   
>   require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-http-boot', 'u-boot-uefi-http-boot.inc', '', d)}
> +require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-capsule-update', 'u-boot-capsule-update.inc', '', d)}
>   
>   DEPENDS += 'python3-pyopenssl-native'
>   
> diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/uefi-capsule-update.cfg b/meta-arm/recipes-bsp/u-boot/u-boot/uefi-capsule-update.cfg
> new file mode 100644
> index 00000000..8cc4a453
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/u-boot/u-boot/uefi-capsule-update.cfg
> @@ -0,0 +1,5 @@
> +CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=y
> +CONFIG_EFI_CAPSULE_ON_DISK=y
> +CONFIG_EFI_IGNORE_OSINDICATIONS=y
> +CONFIG_EFI_CAPSULE_ON_DISK_EARLY=y
> +CONFIG_EFI_CAPSULE_FIRMWARE_RAW=y
> \ No newline at end of file

Resending the email in case it

Thanks,

» Javier Tia 🖋

