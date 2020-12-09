Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web11.2108.1607545049467310352
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Dec 2020 12:17:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A/LJcF5b;
 spf=pass (domain: gmail.com, ip: 209.85.167.194, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f194.google.com with SMTP id f132so3085988oib.12
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Dec 2020 12:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=XJvmsWY8QyD5BRkD2vjC5abKTAt3BDmNE9Lvpj0Utm4=;
        b=A/LJcF5bzBfDxRnLrKalrdyIg/cP6v5csERp3f4kqp6dDhXjdiUEbh/bTRusrLrdR6
         eVNXmNHfzB6v/+Hayx2jrgn7OldIrr54/2iL478b9Qh/L5DvnBWGK+i2Sb4pN+0nZ/KB
         tfgjGNECAGlxr+1dNNaYRWsuXOJr63w3XSTklgbdCf1nlGb18aMEIF02LuKJQT5HRmnn
         tI0p2qaUqG4Px2w5Y+d0QlTqq4knWgUqlg5XUtsnBiAj4ttolAdmrhHREeKOK99jKsaK
         nYwVVU0hfqaKOyvYWY1GJyKVF5irilQIvB9LdGY7qQIOcqoNrisJrny9J9vy1/Ok7cot
         E6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=XJvmsWY8QyD5BRkD2vjC5abKTAt3BDmNE9Lvpj0Utm4=;
        b=XZRMqZPJWx72YO9bXyI5qvO1ScG3NrzUXvriM1pPy93NSpiu/xyLwNUIA9rqJhV9By
         hq2k+lrnq355YBpmVYguv9yNcksWtKJGHzvRM1HIoaEEgxrLuZQR4TA3vVObnGpDciYj
         H+0au65nbJCiaQxiXx6TncuLMQC0A9WJT8wH0HNWTLQJU+Y77ZpQ8qqKCIVQs/tMWw5y
         05kF3I7uP3iFVykPFAGR/zx+J4vnzbULsqY4WPSjiAnpEhWay4y6rh4lT+N1gnFRtmE0
         gZze1e8ZetoEnpkBovE8TqoafIxVnj//RQKeXGmFDtqEjkAGP96K9dPp1lzDTEEBfI8s
         T6yQ==
X-Gm-Message-State: AOAM533Zrv8c0SLaG56DGBt01Bh94vltVHjQ6eArRB2zloCX7SGvUIL/
	vutoCdWpqm+ore2Sl/bIKwRHM+rKdLDm2A==
X-Google-Smtp-Source: ABdhPJwxnfUAPj0hqd1YdcbQYIqeN4OPIMrwll0umQun5f1riTCrVOcwyaMWh51QOPdEPaLgeCZ13Q==
X-Received: by 2002:aca:a90a:: with SMTP id s10mr2228722oie.124.1607545048466;
        Wed, 09 Dec 2020 12:17:28 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id o6sm534242oon.7.2020.12.09.12.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 12:17:27 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/qemuarm64-secureboot: don't use -dev kernel
To: Ross Burton <ross@burtonini.com>, meta-arm@lists.yoctoproject.org
References: <20201209105714.4193993-1-ross.burton@arm.com>
Message-ID: <be56ddd3-9dd2-bc30-358d-b228bc63c18d@gmail.com>
Date: Wed, 9 Dec 2020 14:17:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201209105714.4193993-1-ross.burton@arm.com>
Content-Type: multipart/alternative;
 boundary="------------70C1F2C12CAE0CE5F57F99CA"
Content-Language: en-US

--------------70C1F2C12CAE0CE5F57F99CA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/9/20 4:57 AM, Ross Burton wrote:
> According to the comment linux-yocto-dev was being used to get a 5.5
> kernel as 5.4 was panicking on boot.  Now linux-yocto defaults to 5.8
> so just use the standard kernel instead.
>
> Change-Id: Id382c69f16f2ff4b2cbc63be94a645e56616549d
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta-arm/conf/machine/qemuarm64-secureboot.conf | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> index f2c15e6..fe19ed2 100644
> --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> @@ -6,10 +6,6 @@ KMACHINE = "qemuarm64"
>   
>   UBOOT_MACHINE = "qemu_arm64_defconfig"
>   
> -# The 5.4 kernel panics when booting, so use the development kernel until the
> -# default kernel is upgraded (5.5. supposedly works)
> -PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
> -


Seems reasonable to me. Thanks for following up!


>   QB_MACHINE = "-machine virt,secure=on"
>   QB_OPT_APPEND += "-no-acpi"
>   QB_MEM = "-m 1024"
> @@ -23,4 +19,3 @@ IMAGE_FSTYPES += "wic wic.qcow2"
>   WKS_FILE ?= "qemuarm64.wks"
>   WKS_FILE_DEPENDS = "trusted-firmware-a"
>   IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
> -
>
> 
>

--------------70C1F2C12CAE0CE5F57F99CA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/9/20 4:57 AM, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20201209105714.4193993-1-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">According to the comment linux-yocto-dev was being used to get a 5.5
kernel as 5.4 was panicking on boot.  Now linux-yocto defaults to 5.8
so just use the standard kernel instead.

Change-Id: Id382c69f16f2ff4b2cbc63be94a645e56616549d
Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index f2c15e6..fe19ed2 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -6,10 +6,6 @@ KMACHINE = "qemuarm64"
 
 UBOOT_MACHINE = "qemu_arm64_defconfig"
 
-# The 5.4 kernel panics when booting, so use the development kernel until the
-# default kernel is upgraded (5.5. supposedly works)
-PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
-</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Seems reasonable to me. Thanks for following up!</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20201209105714.4193993-1-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">
 QB_MACHINE = "-machine virt,secure=on"
 QB_OPT_APPEND += "-no-acpi"
 QB_MEM = "-m 1024"
@@ -23,4 +19,3 @@ IMAGE_FSTYPES += "wic wic.qcow2"
 WKS_FILE ?= "qemuarm64.wks"
 WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
-
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------70C1F2C12CAE0CE5F57F99CA--
