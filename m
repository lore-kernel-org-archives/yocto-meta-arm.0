Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCCECDE01F
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 15:55:27 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web10.47292.1727366120813770184
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 08:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ra//umrQ;
 spf=pass (domain: linaro.org, ip: 209.85.221.169, mailfrom: javier.tia@linaro.org)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-503f944f174so394813e0c.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 08:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727366120; x=1727970920; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YyREOIVPKrbDjhnbJ7nmm2MRJZEvkLY9uV0l7l7G7jE=;
        b=ra//umrQpQE34PUoHSony2hK+SceHvBUiq4wC3ScCmn+CSEeX9Fbw/TzxZzHa7E8dN
         2BLO8FSGSDueoMiF1AvcLN8LJFEwWqQUjAmTcU5/Njlt50MVerJqKt0h3UZ9vuDuB6gA
         osN8qRu/e/5YpipNt59o+IF4Ps9JmJXuRej8oXRy405Y9ZkFE0W3ASs7ozbZq+cdJQrb
         LB4d+OMgYz8rlJclqFboOtj3ZdQc7NTBOT6rkRc/WRfluseC6T7duloseRJ3qpWirKMa
         jKCTcLm7Gd+pw0IFxSbtPlECA8AJi7wkLf0LUp6yyl4yPZADMzd6zV5Q/k4KjEkez480
         /ogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727366120; x=1727970920;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YyREOIVPKrbDjhnbJ7nmm2MRJZEvkLY9uV0l7l7G7jE=;
        b=ZUG1TaPYum6jwHqHd4RFVdpK7Q6b3A3bdS7Ml4Xl7pzS3kyCtvCzehlkGl7Yqze4zI
         Ct2kV8md/mXbfiY+oCB2+TzXcJCZWlxg5XbPqaWpvur+qDBBVPFPxqOLUxuSvB2TWY3e
         MSFBLfToQ8taH4/3mFMJengEG/TmO9bCJ870QkAfTfwgUGV0ph0WuPmZ51esMKutWoUV
         IvMTJwAXQlUuyANj6dLldswrPsFa2uwCp/y0K6BbFdcwgvpWdBc/F8EE42g0GXoyqMZV
         2dw4+3sOUxrMuLBALArz/zlyFfIp+7gMBj6WKHAPQkZ9kcuO6EALBt8W1LyaNIuULn4v
         TGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtv+z7TvcM14p6Tbuacq+6RnUiqTgeS6qMfK+vmbdJ7rg02qyeG2ii0xV9ThmAU13CoQP9T6Rc4A==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwXWb7MFZRkdLn/9AN0FHW4MsGrtdVi9V1u9HPvo9bcQfaGZh18
	kYuQVsQ3uj4V27pUWrEgsF6x3sum+Noxky0YnMaZjnrEYPRRVBiN/4e7+ls+bxU=
X-Google-Smtp-Source: AGHT+IH4pWMxfVxFeqep76X9QUVmgpi44gHvK2PWO3YnvWS6ASbAGtG5slEtsOMaOQOABeeY7iX4JQ==
X-Received: by 2002:a05:6122:915:b0:503:1ca5:261e with SMTP id 71dfb90a1353d-507816debdemr99866e0c.4.1727366119725;
        Thu, 26 Sep 2024 08:55:19 -0700 (PDT)
Received: from [192.168.8.164] ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-50781a08d40sm3640e0c.9.2024.09.26.08.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 08:55:19 -0700 (PDT)
Message-ID: <a44c39f0-4282-4438-a3d6-c916dbcb28c7@linaro.org>
Date: Thu, 26 Sep 2024 09:55:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arm] [PATCH v7 0/4] UEFI secureboot
To: jdmason@kudzu.us, meta-arm@lists.yoctoproject.org
References: <20240926154739.2379609-1-jon.mason@arm.com>
From: Javier Tia <javier.tia@linaro.org>
Content-Language: en-US, es-MX
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <20240926154739.2379609-1-jon.mason@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 15:55:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6122

Hi Jon,

On 9/26/24 9:47 AM, Jon Mason via lists.yoctoproject.org wrote:
> Sending a modified version of Javier's patches, combined with a subset
> of the patches sent out by Mikko recently.  This was done to expedite
> the acceptance of this series (given the code freeze tomorrow).  Also,
> the optee update that Mikko's series included cannot be included (given
> the code freeze).  2 of that series are needed for this one.  So,
> combining everything into this and sending it out publicly for Javier,
> Mikko, and anyone else to ack/nack.

Thank you for sending them ahead of me, as I was just preparing the cover letter to send them out as v7.

> Thanks,
> Jon
>
>
> Javier Tia (3):
>    arm/optee: Add optee udev rules
>    arm: Enable Secure Boot in all required recipes
>    arm/qemuarm64-secureboot: Enable UEFI Secure Boot
>
> Mikko Rapeli (1):
>    arm/optee-client: fix systemd service dependencies
>
>   .gitlab-ci.yml                                |  1 +
>   ci/uefi-secureboot.yml                        | 37 +++++++++++++
>   meta-arm/classes/sbsign.bbclass               | 31 +++++++++++
>   .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++
>   .../u-boot/u-boot-uefi-secureboot.inc         | 17 ++++++
>   .../u-boot/u-boot/uefi-secureboot.cfg         | 10 ++++
>   meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  2 +
>   meta-arm/recipes-bsp/uefi/gen-sbkeys.bb       | 48 +++++++++++++++++
>   .../recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh | 52 +++++++++++++++++++
>   .../systemd/systemd-boot-uefi-secureboot.inc  |  7 +++
>   .../systemd/systemd-boot_%.bbappend           |  1 +
>   meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
>   .../recipes-core/systemd/systemd_%.bbappend   |  1 +
>   .../linux/linux-yocto%.bbappend               |  2 +
>   .../linux/linux-yocto-uefi-secureboot.inc     | 14 +++++
>   .../recipes-security/optee/optee-client.inc   |  8 ++-
>   .../optee/optee-client/optee-udev.rules       |  6 +++
>   .../optee-client/tee-supplicant@.service      | 10 ++--
>   18 files changed, 272 insertions(+), 5 deletions(-)
>   create mode 100644 ci/uefi-secureboot.yml
>   create mode 100644 meta-arm/classes/sbsign.bbclass
>   create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
>   create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
>   create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
>   create mode 100644 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb
>   create mode 100755 meta-arm/recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh
>   create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
>   create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
>   create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
>   create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
>   create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
>   create mode 100644 meta-arm/recipes-security/optee/optee-client/optee-udev.rules
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6117): https://lists.yoctoproject.org/g/meta-arm/message/6117
> Mute This Topic: https://lists.yoctoproject.org/mt/108670112/7165667
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [javier.tia@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>


» Javier Tia 🖋

