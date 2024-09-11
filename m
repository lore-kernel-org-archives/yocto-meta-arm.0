Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D523CEE57CF
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 18:59:25 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.29815.1726081156608634618
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Sep 2024 11:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qJ7kVMpe;
 spf=pass (domain: linaro.org, ip: 209.85.222.51, mailfrom: javier.tia@linaro.org)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-846db33f4e5so65329241.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Sep 2024 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726081155; x=1726685955; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0VselrMLO8lSEJA97DaEoauBuvesDbAjjGAP6+rTmns=;
        b=qJ7kVMpeXSU6hUnY1+6Lgp2iViu1FM/k/mbXKR+X/ktv4wgTMAwXZRBuCdyCHrtJzK
         rv239u352QLp7tsAu/VbTPj99RBWhNWualVy5T7KVhUqPHJ/KSW5Df+B554Eo+S1fLRM
         lIEaoajWtBfBUlWffVB9Tmf9Eot8+gTHPCyAxztxvYCIS1A6rZR4RbQ3KeSJrBnveqZ7
         cDZbSP67zrJFxvrkYm4UZ5WE5/7L4Qpa+CvKRfGtYGQS7RUa/OS4B0VI5EmmaDZ6Ms2v
         bgtDL88gR7oovzJCPsX3coId7ViWhNhS870aMpydvj7sRSN1K+zALuxJ7PlvJZoX3Tce
         buVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726081155; x=1726685955;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VselrMLO8lSEJA97DaEoauBuvesDbAjjGAP6+rTmns=;
        b=mjTy4qvgRPA6EYkiI1Liy7HZDYSVSII4S6SU+v1T9aW/to67BmkslTgPvtSZwGqXu6
         pnLnV5y432QwgPhdGpxMToYUcZMTk97rl2Iu+9RBr5XxDAy5mhF8IbRGpiLc+UePPUUF
         m60lsWcGE4zNYkL5DIsqRC3Es9eJmuVL+CnFpmVJ+3ZZKhXSdOF0grxJmm4UUeRgYPjv
         xBVZdyPAZwh3+xcvbYsoitu/HnI7GD7UzdgUCGTBAy8VQ9VJhgwINLy0VfFXzfLO4vEM
         HRi4kI72kX9kizgasMZ8cWwpMioKq2RLVkea4Vdfp0ic1aOOeJoWI2xqCTcLzpX9+r5A
         a9+Q==
X-Gm-Message-State: AOJu0YyLwg9JP7oP4GDEbFtOwlTwJLO3R76Us/gLnGJC0vRmoLke3jJm
	aETMGSD7/+BilxoKENhykIehIF9sPuMgr/lsZFfNYgOoKrZ3QQeGsC36QVqoDgBWMC3XOBsngob
	Z
X-Google-Smtp-Source: AGHT+IELMqIPPiextow+y05875emLmZCka2/fFBgoL7tUxZp0bg01Py6v3YjoEs9K436FYTCBQAAAg==
X-Received: by 2002:a05:6102:a48:b0:49b:e7d7:3e1b with SMTP id ada2fe7eead31-49d41468125mr693785137.3.1726081155153;
        Wed, 11 Sep 2024 11:59:15 -0700 (PDT)
Received: from [192.168.8.164] ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-84906e8946dsm61422241.27.2024.09.11.11.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 11:59:14 -0700 (PDT)
Message-ID: <d51c78f5-db9a-47d8-8c73-6bb352bd19bd@linaro.org>
Date: Wed, 11 Sep 2024 12:59:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] qemuarm64-secureboot: Add UEFI Secure Boot
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Ross Burton
 <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
References: <20240904224349.108885-1-javier.tia@linaro.org>
From: Javier Tia <javier.tia@linaro.org>
Content-Language: en-US, es-MX
Autocrypt: addr=javier.tia@linaro.org; keydata=
 xsDNBGMbo5sBDADCQ76eCmcJODsawn/XiUnUf1KA5WhbuEb5MV66/vQKyNF+DKlp81JZq8bF
 vusPuaq7yhYB7i3nYy9y1m0M1xdKSIU+TVaLSdXXR8muyJl3ukeRs6j9QgA4K5knoA9HWE7z
 luB0xCS7Ish2WAbQHzWLbXGrR3wfGmgHp63G5mwBrmrjNg2m6UnGaMSMJHN3UnReFF7oUQfy
 W+t+fCmH2pcvhHmf9BoFKRl6LJNm5QdXk76qBKVLPo9441FzSLgmAjmW164XRn90FEH5xM03
 ApCeoIV5nE9G+jY/tF/L42cIH4G8qVb1EQcsyKKkkVwYTPMfIfQjiSQE2Kjzuomsj3rnVVPf
 ZMmRoDtmsS9LtUDeiWcjDNLyxQQQn6Ilbax4xirEGXJd8WCNaghO5S5IyOYv2pgu41/igmAd
 ENEVxPkCqn+cbNa1EeU4KmaEy/sR8XoqrIr/o66SUhPlVmn9p/vl/X49NRUy6TfketVRblUx
 vqqDb8/IrRYG3fdJizCYln0AEQEAAc0iSmF2aWVyIFRpYSA8amF2aWVyLnRpYUBsaW5hcm8u
 b3JnPsLBDgQTAQgAOBYhBJsTsgvPDt4jRUqTybXuwwuoZ3cfBQJjG6ObAhsDBQsJCAcCBhUK
 CQgLAgQWAgMBAh4BAheAAAoJELXuwwuoZ3cfDakL/2fgzvpTJiImnUY6r8xR3LEJdp6/GErx
 81V0VFjAmyQ8xwu8B5hb5ApVs79JafBPZh7Kyx4kbjTNhfgUxtAHNko2UMp/BfpYwxgTfAfT
 gDUCzW9BwmiDRONO3LFG3f419ELaQ3LjlJGlYbvLqXU4noojHF1DCjNjL68VAZJI0j4Hzf2b
 WlxGtTCM7hYdCe9nKt+oEyoQTl6yowt8YG6y+MeSN5atknqjrnvKZnpVYng/lMC/OJpvsO7N
 I8gEZIbIRcJId4ycG9GR0QBCN4NlYvbXwd08K1/OfuLwY4cwMI5INLqguNu6adjlUJ7svhxU
 aJOTz03vbZd7dW3b11fsmVLDB0iBBkZ0g+LzhOJpK098deO1kUhJMDLyrYurdR2ib0Li2hLG
 F+HEPUhUu1JIo5RfqTzxCVHe8L3GT8qCdU9ASUlLFQL1L9M6llwTyJeoz1whT43A0D+Bo+Yt
 bT8Wbbt4q42y270GEPVBgyWEovzTGMcjKZV+GCCE0gsCuU/eJM7AzQRjG6ObAQwAzv7E75BP
 uNQ9Vq17rqB+MUqutfgtUZJkEyNVhBtxzgwxXO2lIl2TG3pE6ldeQJHFsWRdt1j72e0WXGAo
 s4k+/+jBCybQw/fcD+h93ynBmBdnv0Gg0R/3IIjh9+sMm6QId62QxiwM6FjE5M5MEfVKaZzd
 81wMsmOh2pYgvhm/FDZiOci0FP0A7/xVqEdu9oLG803qahDJScjXuVU4055wbnNQ955m0AYe
 XDJrhvL1cIKqM13W2kfbBNX1Y/m9h0mDN7L9tllPunlStTChIaU53N+Bia1FfLUAWBZFblqW
 f+rZc08liS39WRb5Ek+TtQi5TYabrmLwtL2tD+260yP/SbxTS6CJrcKHjB2qPs+yyT/ZBk0D
 g7DwvKhu1gvk4/bcKgDN7mMwZNyuOjX3JnRzotLiPoRRiBOqqxyyla7dkK1SBBKYzR3i38s/
 Oyx3uyimWSgkWorfHigUaV4zV06JpbE3Nuf/ygu8DiKNwFJgOhbm1qZxHT89Y369Pf93yc1L
 ABEBAAHCwPYEGAEIACAWIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCYxujmwIbDAAKCRC17sML
 qGd3Hz1QC/9pUkkhawM0WEIJRn8vy4OD2Kmnr+KnyWAugC1CghXsl+bkB2EbHavweAqHP9KM
 jBVArqR4+Dmuns0xFWDzeBtmaZZpMltIjdgjkxASE2/PGfrrliE4gmN3eSULm9mA2hEqhUUD
 IvOXChQjgQg5a96st3ne+E94nV6ZM0lkPo/xuami1J/iE0xzzZ0kpWbzn/J0O7x7lkns7TMl
 NAuGoz2wiNmr+YQMpWZUhG8dwMOwyMec28XqsG0wXs0bmamE/2qxurFeKs0X+AwyhTVO7mhl
 ADuPzNpC43toRmpcatIPrjDiLi+8p5QPME2XfCMusgIX/Z8UqIajOKIuCAescF5lmUfN05ou
 0DRpy6BSPVApS8v1S2kYlWyHm0+LhO4HWKgh/iIfYdYVeFs9I733KL9PvUAI6SqtMwYWH9UB
 5CZs1TgzocqaktEEBQJ76SKl4lU4yQJW9Pa33RRHpUXKNSg7Y2GChiD8zbi0vR/LC65omza9
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <20240904224349.108885-1-javier.tia@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Sep 2024 18:59:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6072

Hi,

Reviving this series in case it has been lost under the cracks. A copy at:

https://lore.kernel.org/yocto-meta-arm/20240904224349.108885-1-javier.tia@linaro.org/

Thanks,

On 9/4/24 4:43 PM, Javier Tia wrote:
> Hi,
> 
> Addressing comments from patch series v4.
> 
> A backport from meta-ts with the minimal changes to add UEFI Secure Boot
> into qemuarm64-secureboot machine.
> 
> Requirements:
> 
>    - Create a UEFI disk partition to copy EFI apps.
> 
>    - Add UEFI settings to U-Boot, systemd-boot, and Linux kernel.
> 
>    - UEFI keys are to be stored in U-Boot and used to sign systemd-boot
>      and Linux kernel images.
> 
>    - Add systemd as Init manager. systemd's modern architecture,
>      integrated security features, and enhanced management capabilities
>      make it a more suitable choice for systems using UEFI Secure Boot
> 
> Introduces uefi-secureboot machine feature.
> 
> UEFI keys must be generated in order to be added to U-Boot. Sign both
> systemd-boot EFI app and Linux kernel image.
> 
> Build and verification steps:
> 
> $ kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml
> 
> ---
> 
> Changes since v4:
> - Big refactor to only two commits to add Secure Boot in all required
>    recipes and enable it in qemuarm64-secureboot.
> - Fix the generation of SB keys in build time.
> - Remove the need to pass the keys in each recipe, as all the keys will
>    be generated in one directory.
> - Introduce uefi-secureboot.yml with all required settings for Secure
>    Boot.
> - Do several renamings to keep name consistency.
> - Explain why systemd is used as the Init Manager.
> - Revert the change using core-image-minimal; keep using
>    core-image-base.
> 
> Changes since v3:
> - For image creation, use core-image-minimal instead of core-image-base.
> 
> Changes since v2:
> - Remove commit "qemuarm64-secureboot.yml: Set branch to scarthgap".
> 
> Changes since v1:
> - Rework all subject commits to follow OE, Yocto, and meta-arm
>    guidelines.
> - Add gen-uefi-sb-keys.bb recipe to generate UEFI keys.
> - Add an OE test to validate UEFI Secure Boot.
> - Simplify gen_uefi_keys.sh to avoid code repetition.
> - Replace grub with systemd-boot.
> - Simplify signing binary images with sbsign class.
> - Set OE branch to Scarthgap.
> 
> Changes since the v0:
> - Remove u-boot recipe.
> - Split the change in several commits.
> - Remove sample UEFI keys.
> - Validate UEFI keys exist before building.
> - Insolate most of changes under uefi-secureboot machine feature.
> 
> Javier Tia (2):
>    Enable Secure Boot in all required recipes
>    qemuarm64-secureboot: Enable UEFI Secure Boot
> 
>   ci/qemuarm64-secureboot.yml                   |  1 +
>   ci/uefi-secureboot.yml                        | 34 +++++++++++++
>   .../u-boot/u-boot-uefi-secureboot.inc         | 17 +++++++
>   .../u-boot/u-boot/uefi-secureboot.cfg         | 10 ++++
>   .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
>   meta-arm-bsp/wic/efi-disk-no-swap.wks.in      |  2 +-
>   meta-arm/classes/sbsign.bbclass               | 31 ++++++++++++
>   .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++
>   meta-arm/recipes-bsp/uefi/gen-sbkeys.bb       | 48 +++++++++++++++++++
>   .../recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh | 36 ++++++++++++++
>   .../systemd/systemd-boot-uefi-secureboot.inc  |  7 +++
>   .../systemd/systemd-boot_%.bbappend           |  1 +
>   meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
>   .../recipes-core/systemd/systemd_%.bbappend   |  1 +
>   .../linux/linux-yocto%.bbappend               |  2 +
>   .../linux/linux-yocto-uefi-secureboot.inc     | 14 ++++++
>   16 files changed, 234 insertions(+), 1 deletion(-)
>   create mode 100644 ci/uefi-secureboot.yml
>   create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
>   create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
>   create mode 100644 meta-arm/classes/sbsign.bbclass
>   create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
>   create mode 100644 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb
>   create mode 100755 meta-arm/recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh
>   create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
>   create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
>   create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
>   create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
>   create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
> 

» Javier Tia 🖋

