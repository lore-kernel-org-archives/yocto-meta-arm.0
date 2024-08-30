Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EBDCA1008
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 15:57:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.20047.1725033452533066583
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 08:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Geue22wF;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso21508995e9.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725033450; x=1725638250; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nUExZaUNinXfyGf+Wb6M1RrpfGBPyZItslnNxof41Q=;
        b=Geue22wFXgIC8W5lMkY2Xr4IBnxQHP5vRNGKlk8/v6aLgOLl6QedMHpj9bdndhfk3h
         AcrZkAA8LfBAj+jE9eXfnZ9Gaa3dekbHQ6wdpvpYiPD9l/rqVxTui4F0X53U2UppNNAo
         xILr2RYRMQq7J5jOwOWWC7jXax3h4LtXWhWsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725033450; x=1725638250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nUExZaUNinXfyGf+Wb6M1RrpfGBPyZItslnNxof41Q=;
        b=aSsTfD2qWR1VnqbEc3McC+4BTcf6OQbEitmmsw5cK6k4KnTv2e6rWv1qwVt6rk3B6X
         ny4xLLI9wInoNbwdVhf3DDutl3gIhiR6qPXzib5rONY3PsLndDdlM6erlVSjuJW6p1zq
         dmB2OBC422vjjr4CDHhSTgvZMy1oxgWgfCXgg5jywWYwEdkPiEK5Ntvyrk2F0af6sho/
         vxafUJC/vb55lZeISuCfdj7rvTjQR8M0G/kSU+yW69F3q6kiY5fwVGSronT0oEoDekTU
         7E43hEC830t5rwdOeKkeMD+1D+BfxnkF0c/sDqxwP5NIp6qMWapZQ2r7XWq74qbOY4Ea
         QEcg==
X-Forwarded-Encrypted: i=1; AJvYcCXk5eqbz+J+CtFKKb2hIE/u9RBQrUHd/aMtOn2bRbUDL5+UysM1vvhRmSJjmO73DSWF8lfLyEClSg==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yx5p7M5AKYCzbR7uIkzbu/cerw3qfhcXiwpXxOYcUGFu3k55ywr
	9QC9EFvCEcUZTfqXGh7MYeoZgVX1SBIv3F9eeZuJY/YIEEmGicDFWXlif31FoUI=
X-Google-Smtp-Source: AGHT+IEtMysW23y5xmk5X+CzVjA+KW7Oz+2hD8maT0vUXl5iYZZOps48zr1kTirLMWnuc4aD5CMFfQ==
X-Received: by 2002:a05:600c:4586:b0:426:61fc:fc1a with SMTP id 5b1f17b1804b1-42bb01ae2a7mr63315465e9.3.1725033450444;
        Fri, 30 Aug 2024 08:57:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee9978bsm4327646f8f.49.2024.08.30.08.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 08:57:30 -0700 (PDT)
Message-ID: <bf53012b-490d-457d-b6b4-203ce8c44400@smile.fr>
Date: Fri, 30 Aug 2024 17:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arm] [PATCH 2/3] external-arm-toolchain: in libc.so GNU ld
 script use base_libdir
To: Jon Mason <jdmason@kudzu.us>, Denys Dmytriyenko <denis@denix.org>
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>, Ross Burton
 <ross.burton@arm.com>, Denys Dmytriyenko <denys@konsulko.com>,
 meta-arm@lists.yoctoproject.org
References: <20240417113042.91880-1-vvavrychuk@gmail.com>
 <20240417113042.91880-3-vvavrychuk@gmail.com>
 <20240417201213.GU28791@denix.org>
 <CAGj4m+47gi6kai=_5ubCtqoz-Qis_uNgERLEn=Ho1otpH0pfRg@mail.gmail.com>
 <20240418155738.GY28791@denix.org> <Zi+mjstvIGWi5o4f@kudzu.us>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <Zi+mjstvIGWi5o4f@kudzu.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 15:57:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6042

Hello,

Le 29/04/2024 à 15:54, Jon Mason a écrit :
> On Thu, Apr 18, 2024 at 11:57:38AM -0400, Denys Dmytriyenko wrote:
>> On Thu, Apr 18, 2024 at 04:54:05PM +0300, Vasyl Vavrychuk wrote:
>>> On Wed, Apr 17, 2024 at 11:12 PM Denys Dmytriyenko <denis@denix.org> wrote:
>>>>
>>>> On Wed, Apr 17, 2024 at 02:30:41PM +0300, Vasyl Vavrychuk wrote:
>>>>> -             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
>>>>> +             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${base_libdir}/ld-linux#g" ${D}${libdir}/libc.so
>>>>
>>>> Here ^^^ it's not clear why only the last of the sed replacements gets
>>>> updated, not all of them?
>>>
>>> 1. `/${EAT_LIBDIR}/${EAT_TARGET_SYS}` path is not used in libc.so in
>>> Arm GNU Toolchain v13.2.Rel1 in targets "arm-none-linux-gnueabihf" and
>>> "aarch64-none-linux-gnu". I am not sure in which versions for ARM or
>>> Linaro toolchain this path was used in libc.so. Should I replace it
>>> blindly?
>>
>> Yeah, this list has grown with different versions of the toolchain, where 
>> almost every new version required a slightly different adjustment in the 
>> past.
>>
>> And the external toolchain recipe was always trying to be version agnostic 
>> and work with a wide range of toolchain versions.
>>
>> But I guess we could simplify the list of supported versions to what is 
>> currently available for download - I see that 11.x and 12.x are supported 
>> now. 
>>
>> Can you please check if libc.so is the same in those versions? If so, we 
>> can potentially drop all other sed mods from here. Thanks.
> 
> meta-arm is going to release very, very soon.  If this series should
> go in, then this needs to get wrapped up ASAP.
> 
> Vasyl, can you check about libc.so (per Denys's question/comment
> above, and possibly do another version if his suggestion is correct)? 

There is a new TI SDK release based on Yocto-Scarthgap [1][2] and the
external-arm-toolchain doesn't work due usrmerge nowaday required by systemd.

I applied this series but there is still an issue with the meson-qemuwrapper:

  qemu-aarch64: Could not open '/lib/ld-linux-aarch64.so.1': No such file or
directory

Indeed ld-linux-aarch64.so.1 is under /usr/lib:

  lmsensors-config/1.0/recipe-sysroot/usr/lib/ld-linux-aarch64.so.1
                                     ^^^^^^^^

[1] https://www.ti.com/tool/download/PROCESSOR-SDK-LINUX-SK-TDA4VM/10.00.00.08
[2]
https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-sk-tda4vm/10_00_00/exports/edgeai-docs/devices/TDA4VM/linux/release_notes_10_00.html#new-in-this-release

Best regards,
Romain


> 
> Thanks,
> Jon
> 
>>
>>
>>> 2. Rest two expressions replace input string to "/usr/lib" or ".", so
>>> they are not affected by usrmerge.
>>
>> -- 
>> Denys
>>
> 
> 


