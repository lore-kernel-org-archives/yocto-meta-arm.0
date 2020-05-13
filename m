Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web12.563.1589392624564710382
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 10:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PXEcOjV6;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id h10so4862872iob.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 10:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3I7AKcE9rITB52Dc28tYRfcaE+8UjBHd9At3xFVqmBY=;
        b=PXEcOjV6T0qZR+DnRhm0PhKwa6RE2eMPnuNxFo/rpBtOEUgqvdF6pn552X4oHLcCcj
         tzBHNqdwGlghMjlSkzSPrAbBiRjhMJjUqhFpaU5rOvpoXYIdGeSSCURvKS2CkN+6L63C
         LwctOAz1syL3eow1c4YqMGvYmJFqVZxV149QF49UcquTdmyGdYLGAaFvCjVa7AQ5WtAr
         sKUQpvIwE/GAaqbRATEbkwB1ZzErDdH2FfN8I5pEHFAqxa7iK51gPD3+gzzoaelDnCOq
         vJRgeBEIlLQzJmA/iXulsYTwR63mKv/hU6x5jwdtDzAeuCRiwc3r8PF86w1BLUP1Ocgx
         7ztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3I7AKcE9rITB52Dc28tYRfcaE+8UjBHd9At3xFVqmBY=;
        b=cagfoQ8Cj1Cp99CkTvHI+BCtZU//Wy52fBOHBaaEpEldb4XB5LMgGxlJ7l+UQ1EL/u
         Xeoo9Buh0o5GdmQN+zXPnFl5Ye5NEFNHfYLB1qhLAsINtTw4r8H4dqNJ1zCr+asXEj55
         wN48OJsK4/5OIqZJ6q2nPWdzIvvVi1AdBRfnVV1ETzico5oLUSBDruT8sXrh5ENNBplO
         B6MmgkC3quYKDEqTDC0TIhCyciTcKMwKxDrIlC4GZSntThyEKiBKl8vIsqwJnv2xWZpy
         AEtTYz/2YxLI0d6JyEYZWyKcJMLN88MXKAPIFZ6xPVd3VKobGDphg4nzAemY5LlEuJza
         5uYg==
X-Gm-Message-State: AOAM533A1dxj83Mmu9nOTZSoK2CuDKt8fMk/uQcl423nfyzDEpz6xzU3
	uIUC2FwwpjjEWCGRC8ZkS5MmRzGfJeI=
X-Google-Smtp-Source: ABdhPJwBuujDxFh+yygONXxqcNDdOXj5NGAUgvbj8SX9DI357G+M5WxCT+mmwW2s1nc9Rxq5pbj3ig==
X-Received: by 2002:a6b:8f85:: with SMTP id r127mr355071iod.209.1589392623571;
        Wed, 13 May 2020 10:57:03 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:11af:b72d:1039:51ec? ([2605:a601:ac3d:c100:11af:b72d:1039:51ec])
        by smtp.gmail.com with ESMTPSA id j2sm151071ioo.8.2020.05.13.10.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 10:57:03 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm][PATCH v3 1/2] trusted-firmware-a: Build out of tree
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200513154707.33747-1-JPEWhacker@gmail.com>
 <20200513154707.33747-2-JPEWhacker@gmail.com>
 <20200513172748.GR11927@denix.org>
Message-ID: <eb5ff4c4-442b-f793-7667-9b2dbcf84a1b@gmail.com>
Date: Wed, 13 May 2020 12:57:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513172748.GR11927@denix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/13/20 12:27 PM, Denys Dmytriyenko wrote:
> On Wed, May 13, 2020 at 10:47:06AM -0500, Joshua Watt wrote:
>> Use the BUILD_BASE variable to specify an out-of-tree build. Eliminates
>> the need to set the TFA_BUILD_DIR.
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
> What are the changes between v1, v2 and v3?

v2 was a rebase on the latest HEAD

v3 changes used "cd ${S}" at the beginning of do_compile instead of in a 
subshell and also added the do_compile[cleandirs] = "${B}"


>
>
>>   .../trusted-firmware-a/trusted-firmware-a.inc | 32 +++++++++++--------
>>   1 file changed, 18 insertions(+), 14 deletions(-)
>>
>> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> index e6d48e4..febd8ce 100644
>> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> @@ -15,12 +15,7 @@ TFA_PLATFORM ?= "invalid"
>>   # Build for debug (set TFA_DEBUG to 1 to activate)
>>   TFA_DEBUG ?= "0"
>>   
>> -# Sub-directory in which to build.
>> -# This must be coherent with BUILD_PLAT make parameter so that deploy can find
>> -# the produced binaries
>> -TFA_BUILD_DIR ?= "build-${TFA_PLATFORM}"
>> -# set BUILD_PLAT depending on configured BUILD_DIR
>> -EXTRA_OEMAKE += "BUILD_PLAT=${TFA_BUILD_DIR}"
>> +B = "${WORKDIR}/build"
>>   
>>   # mbed TLS support (set TFA_MBEDTLS to 1 to activate)
>>   TFA_MBEDTLS ?= "0"
>> @@ -68,7 +63,7 @@ do_configure[noexec] = "1"
>>   DEPENDS_append = " dtc-native openssl-native"
>>   
>>   # Add platform parameter
>> -EXTRA_OEMAKE += "PLAT=${TFA_PLATFORM}"
>> +EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
>>   
>>   # Handle TFA_DEBUG parameter
>>   EXTRA_OEMAKE += "${@bb.utils.contains('TFA_DEBUG', '1', ' DEBUG=${TFA_DEBUG}', '', d)}"
>> @@ -85,6 +80,8 @@ EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', ' BL33=${DEPLOY_DIR_IMAG
>>   # TFA is forcing the host compiler and its flags in the Makefile using :=
>>   # assignment for GCC and CFLAGS.
>>   do_compile() {
>> +    cd ${S}
>> +
>>       # These changes are needed to have the fiptool compiling and executing properly
>>       sed -i '/^LDLIBS/ s,$, \-L${RECIPE_SYSROOT_NATIVE}${libdir},' ${S}/tools/fiptool/Makefile
>>       sed -i '/^INCLUDE_PATHS/ s,$, \-I${RECIPE_SYSROOT_NATIVE}${includedir},' ${S}/tools/fiptool/Makefile
>> @@ -92,8 +89,15 @@ do_compile() {
>>   
>>       oe_runmake ${TFA_BUILD_TARGET}
>>   }
>> +do_compile[cleandirs] = "${B}"
>>   
>>   do_install() {
>> +    if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
>> +        BUILD_PLAT=${B}/${TFA_PLATFORM}/debug/
>> +    else
>> +        BUILD_PLAT=${B}/${TFA_PLATFORM}/release/
>> +    fi
>> +
>>       install -d -m 755 ${D}/firmware
>>       for atfbin in ${TFA_INSTALL_TARGET}; do
>>           if [ "$atfbin" = "all" ]; then
>> @@ -102,21 +106,21 @@ do_install() {
>>               bberror "Please specify valid targets in TFA_INSTALL_TARGET or"
>>               bberror "rewrite or turn off do_install"
>>               exit 1
>> -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.bin ]; then
>> +        elif [ -f $BUILD_PLAT/$atfbin.bin ]; then
>>               echo "Install $atfbin.bin"
>> -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.bin \
>> +            install -m 0644 $BUILD_PLAT/$atfbin.bin \
>>                   ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
>> -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.elf ]; then
>> +        elif [ -f $BUILD_PLAT/$atfbin.elf ]; then
>>               echo "Install $atfbin.elf"
>> -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.elf \
>> +            install -m 0644 $BUILD_PLAT/$atfbin.elf \
>>                   ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
>> -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin ]; then
>> +        elif [ -f $BUILD_PLAT/$atfbin ]; then
>>               echo "Install $atfbin"
>> -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin \
>> +            install -m 0644 $BUILD_PLAT/$atfbin \
>>                   ${D}/firmware/$atfbin-${TFA_PLATFORM}
>>           elif [ "$atfbin" = "dtbs" ]; then
>>               echo "dtbs install, skipped"
>> -        elif [ -f ${S}/tools/$atfbin/$atfbin ]; then
>> +        elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
>>               echo "Tools $atfbin install, skipped"
>>           else
>>               bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
>> -- 
>> 2.17.1
>>
>> 
