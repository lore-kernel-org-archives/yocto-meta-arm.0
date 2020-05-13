Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web12.504.1589392459789476256
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 10:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vIR6nK3S;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id j2so555278ilr.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dGwTfMttMJRTkd09xWjno8odHUd0Wzvg/2VmZxMz3Ac=;
        b=vIR6nK3SQpAon233aFG5PMzZIXpoMN0Lno7zJG6PVyqHWFfuILbbCE5s9+I2P3COET
         RtNxBvN1fs8f83ArQZyWfNfcTrx+GXVDSP/C3L/ItkIENyv/W/3BAqQ46nzD0clyB0oI
         rMYnkBRZOMpKnDiYIp365lR1VZ2Npb5GMXTCzA/AcxWDOd5WOpHkreqPyVFbDh6Utu1H
         bpbzh4t8l6eYoPettGCAS/s3kTjeTj5eUbKSsgKR5q/+jCbhwRgwyClxnvup3MfWyud9
         zSdV5K1+x96pulDppuQWz2myivlskxuIEqyDh4aRRLA0rL7VSvk11cjW/TzanPgf6PH5
         nf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dGwTfMttMJRTkd09xWjno8odHUd0Wzvg/2VmZxMz3Ac=;
        b=n/5TC9VXr+KQ9vchQfaehlaC+h7ufCD1AiXCA6yV6OBx1kb4GgAvSupOhJAkTMT0QN
         AdTIvfURooshNsNUboveHa92abxLuxPgesaTV3V1uOtNfym11rv/5Tt4T1zy3gpHkZVF
         0SyyMWtOW9IQQtp0s4owUPfCbGZMg4n1RYhBm/X3KdCJkL66of3eJ7LaTN7A5SuxBdD5
         z5zxJJbRaBPtQurTNTcLftMySxFMQkY3EB2gh8dPtvRY0jQbUlbJLYfLw0NbvEk2tvwz
         65XgIV/pNLMs9R1cZmwO5G7C1bSKh1cM1yn9hThnimVnVYSy8BOdD3gc1y0jFeW+8Ka+
         jv6A==
X-Gm-Message-State: AOAM530qJHC8QEyKPMPlNLThXilTgzw10CnYXIl4bif9EEmlHkxN40ik
	eCbK4RsnCn/fFzLd+3IKKh9+IW2cON8=
X-Google-Smtp-Source: ABdhPJxWKda5gasMLzAsYnl9PiIRr1VxWSGLpaUaa1Ci9po3n2KW5ol6KnblHN47P0w+6PgY81Sixw==
X-Received: by 2002:a92:a199:: with SMTP id b25mr650287ill.77.1589392458739;
        Wed, 13 May 2020 10:54:18 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:11af:b72d:1039:51ec? ([2605:a601:ac3d:c100:11af:b72d:1039:51ec])
        by smtp.gmail.com with ESMTPSA id z86sm78378ilk.79.2020.05.13.10.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 10:54:17 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm][PATCH v3 2/2] trusted-firmware-a: Install .elf file from subdirectory
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200513154707.33747-1-JPEWhacker@gmail.com>
 <20200513154707.33747-3-JPEWhacker@gmail.com>
 <20200513173310.GT11927@denix.org>
Message-ID: <f49a7362-7368-d1be-1663-189722982f1a@gmail.com>
Date: Wed, 13 May 2020 12:54:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513173310.GT11927@denix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/13/20 12:33 PM, Denys Dmytriyenko wrote:
> On Wed, May 13, 2020 at 10:47:07AM -0500, Joshua Watt wrote:
>> The ELF files produced are in a subdirectory named by the build target
>> (e.g. "bl31/bl31.elf") instead of the BUILD_PLAT directory.
>>
>> Specifically allows this recipe to correctly install ATF for Rockchip
>> RK3399
> I thought you dropped this sentence in v2...

I stupidly assumed that V2 would be the last patch and edited it in the 
git patch editor before sending, so it came back when I sent another 
series :(

>
>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> index febd8ce..4b5da7a 100644
>> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> @@ -110,9 +110,9 @@ do_install() {
>>               echo "Install $atfbin.bin"
>>               install -m 0644 $BUILD_PLAT/$atfbin.bin \
>>                   ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
>> -        elif [ -f $BUILD_PLAT/$atfbin.elf ]; then
>> +        elif [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
>>               echo "Install $atfbin.elf"
>> -            install -m 0644 $BUILD_PLAT/$atfbin.elf \
>> +            install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
>>                   ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
>>           elif [ -f $BUILD_PLAT/$atfbin ]; then
>>               echo "Install $atfbin"
>> -- 
>> 2.17.1
>>
>> 
