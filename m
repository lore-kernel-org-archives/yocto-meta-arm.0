Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E96D6DDF0
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 10:43:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.17930.1731667428696324104
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 15 Nov 2024 02:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YXlM1lp3;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-382171e1a83so1068268f8f.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 15 Nov 2024 02:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1731667427; x=1732272227; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ka08YfboP/cjskOklmPTjm+/LJ0hz32fOaP5if5F1X8=;
        b=YXlM1lp3PXgwhVTJsYVfcj7q7v6mNm43nrD93vKOzbmQ/pKQSJ2rL1q+xoOGe/js8M
         KDp9d7xVAcC4u1iuhZctzvWZn/4Fj7dunZ8o8X5189jFV0HwA/YqFWWIG0BIpAxxyIp5
         J4fcNY+XLCFjEgHXTZDTJaKjO3ki8tMHd8Lm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731667427; x=1732272227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ka08YfboP/cjskOklmPTjm+/LJ0hz32fOaP5if5F1X8=;
        b=BZq2sb4RNFSsCnj9XMH1znvuRdNTr+mLEz0NS1JdFHAmImtB9lRnyRDtfmEmhRO3hg
         u/l/Pc5VUFImPbMWAXpWimwJ5wc4rhoqmy9Q6CyHUu9KpuGkERD+fw5dr/pwwYIawo8l
         dt9OgFtnlyhbrcNCWnK8pr56QfnpzAvfToCag0IjCUpyEcU7EiYeK//N9gQyItOdsOq6
         T3cutj5e7BD/Qfb4uADJzmSds1q4RXGk+9e8ccLxz1SsKOcGWXEMgoSJmP17h6/foryY
         cE9B06FhMq1zEhIyEoWTR2ovrNPKLOYgESWE23dVlEEV2z5Fzp7SduClgY+WP3u8EIhx
         fpIA==
X-Gm-Message-State: AOJu0YxT3kyAOD2J2GnHn9f7KT5h5IGx0SeVbgafCdf/lSRRiUII0M2n
	0MW0GIP6Ywvuf2F5iuXV/Vj6xWWUIBc3kA9WCLHpdAV2BHHoOlahw7/OYKwARbs=
X-Google-Smtp-Source: AGHT+IHajmGP2BiMxGDrabAwx5HO/eVmZOzXwXG/VZep3TZfTXX6eRtBBqBfC+1uEY8avTIFFudKkQ==
X-Received: by 2002:a05:6000:1865:b0:37d:443b:7ca4 with SMTP id ffacd0b85a97d-38214022068mr6303989f8f.14.1731667426886;
        Fri, 15 Nov 2024 02:43:46 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da244924sm53212425e9.7.2024.11.15.02.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 02:43:46 -0800 (PST)
Message-ID: <de92b84b-61d5-42d1-a546-8a23cf7bbc1e@smile.fr>
Date: Fri, 15 Nov 2024 11:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arm] [PATCH v2 1/8] external-arm-toolchain: remove old sed
 fixup for libc.so
To: Jon Mason <jdmason@kudzu.us>, Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com
References: <20241025165002.2794821-1-romain.naour@smile.fr>
 <20241101185522.GJ20070@denix.org> <ZzZ-mOKHTBYX1t_T@kudzu.us>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ZzZ-mOKHTBYX1t_T@kudzu.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 15 Nov 2024 10:43:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6250

Hello Denys, Jon, All,

Le 14/11/2024 à 23:50, Jon Mason a écrit :
> On Fri, Nov 01, 2024 at 02:55:22PM -0400, Denys Dmytriyenko wrote:
>> FYI, Ross and I discussed the whole external toolchain support a while back 
>> and we were under the impression that there were no users of it and he was 
>> planning to deprecate the entire external toolchain support after Styhead was 
>> out. I wonder if your patchset changes the plans...
> 
> As we now have a known user, let's keep meta-arm-toolchain around a
> little longer.

Not only me but also users that replied in April 2024.

> 
>> Either way, I reviewed your patches and they seem reasonable. I currently 
>> don't have an active setup with external toolchain, so was not able to do any 
>> testing yet.
>>
>> If Jon is willing to run these through the CI paces, I won't mind giving my 
>> Reviewed-by: stamp.

I missed the discussion about external toolchain package back in 2020:

https://lists.yoctoproject.org/g/meta-arm/message/599

I wasn't aware that it was not recommended anymore.

Still, using an external toolchain for TI SoC is helpful for r5 and aarch64 builds.

> 
> I ran it through CI, and it passes (sort of).  There is an issue with
> QEMU 9.0.4, but when I regress that recipe to the previous version
> then it passes.  Since that is outside the scope of this series, I've
> queued these in master-next and added Denys' acked-by to each of them.

I tried  to use gcil as much as possible. I noticed recent runtime issues due to
systemd provided by poky-altcfg but it was out of the scope of this series.

In addition, I tested this series with the yocto build I use for my customer.

Best regards,
Romain


> 
> Thnks,
> Jon
> 
>>
>> -- 
>> Denys
>>
>>
>> On Fri, Oct 25, 2024 at 06:49:55PM +0200, Romain Naour via lists.yoctoproject.org wrote:
>>> As reported by Vasyl Vavrychuk [1], /${EAT_LIBDIR}/${EAT_TARGET_SYS}
>>> is not present in libc.so in the latest prebuilt toolchains:
>>>
>>> ARM32:
>>>   $ cat ./gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/lib/libc.so
>>>   OUTPUT_FORMAT(elf32-littlearm)
>>>   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )
>>>
>>>   $ cat ./gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc/usr/lib/libc.so
>>>   OUTPUT_FORMAT(elf32-littlearm)
>>>   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )
>>>
>>>   $ cat ./arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc/usr/lib/libc.so
>>>   OUTPUT_FORMAT(elf32-littlearm)
>>>   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )
>>>
>>>   $ cat ./arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc/usr/lib/libc.so
>>>   OUTPUT_FORMAT(elf32-littlearm)
>>>   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )
>>>
>>> Aarch64:
>>>   $ cat ./gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/aarch64-linux-gnu/libc/usr/lib/libc.so
>>>   OUTPUT_FORMAT(elf64-littleaarch64)
>>>   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )
>>>
>>>   $ cat ./gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/lib64/libc.so
>>>   OUTPUT_FORMAT(elf64-littleaarch64)
>>>   GROUP ( /lib64/libc.so.6 /usr/lib64/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )
>>>
>>>   $ cat ./arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/lib64/libc.so
>>>   OUTPUT_FORMAT(elf64-littleaarch64)
>>>   GROUP ( /lib64/libc.so.6 /usr/lib64/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )
>>>
>>>   $ cat ./arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/lib64/libc.so
>>>   OUTPUT_FORMAT(elf64-littleaarch64)
>>>   GROUP ( /lib64/libc.so.6 /usr/lib64/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )
>>>
>>> We can safely remove old sed fixup for libc.so.
>>>
>>> [1] https://lists.yoctoproject.org/g/meta-arm/message/5565
>>>
>>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>>> ---
>>>  .../external-arm-toolchain/external-arm-toolchain.bb          | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
>>> index 1e8c1116..1095736b 100644
>>> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
>>> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
>>> @@ -213,13 +213,13 @@ do_install() {
>>>  	rm -rf ${D}${includedir}/rpcsvc/rquota.*
>>>  
>>>  	if [ -f ${D}${libdir}/libc.so ];then
>>> -		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
>>> +		sed -i -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
>>>  		sed -i -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${libdir}/libc.so
>>>  		sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
>>>  	fi
>>>  
>>>  	if [ -f ${D}${base_libdir}/libc.so ];then
>>> -		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../lib#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
>>> +		sed -i -e "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
>>>  		if [ -f ${D}${base_libdir}/libc.so.6 ]; then
>>>  			sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_libdir}/libc.so.6
>>>  		fi
>>> -- 
>>> 2.45.0
>>


