Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D22C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 17:39:26 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.165157.1680802759979237855
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 10:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=FtctS/dT;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-54c0dd7e2f3so46912847b3.8;
        Thu, 06 Apr 2023 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680802759; x=1683394759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8X6E0LABnax5+1rGpi/V5LZq687Js7hQ+EnflHfyajI=;
        b=FtctS/dT58KIPpFHI8+rGFM4NVs2aoZn1lyQAsF267QPMHfyMzu8jDlNAilDzCzyG9
         Ls6kXZ8tbF24AES8Cg/Zr/jsf01Qvl+U7aEy0lsnrmujggwEQlM0EicWWMaqBDUcELpd
         skUNWdMSBOKmcFf4P/YQQ4yg28FDPWOowZR2FBakoCmdOQJcEDuaQbJ0ZkazzdXHJKQC
         eBhl43hA743zI/PYpl5ncDGBxJPUAAKbIIkzBt3+3wDBdD2DrKQC8HXA/u5u7+/8O5Tj
         xDvwkWTQuFilGScBdGXQ7V5mQYmQbHeLc2j3KtjGVevvqElIoTpfJCeW3UcC5WuL9wE5
         t3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680802759; x=1683394759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8X6E0LABnax5+1rGpi/V5LZq687Js7hQ+EnflHfyajI=;
        b=OCc4kiXvi2bl877L5vXjnQmbDEDPBI2RnOgn6GCX3qM3wKfyAPe+wr0dVnJ/Yrg2ER
         Gaw8QffbGn/rXWXXjn3yphgr5O8y/Kt5F/J3557AMPTRnl+DOF099Th0PcnJd8JA4pAv
         O6C23p4v52mczMvmNKcFEOcS5sPetczZ+Et0l5pUOaiqav+Ta25TcF1nJBN93tpYjkJ/
         mkaHhkQ1m8eEfp2D9bayYBdXF068enWD9PTdVJLCNVSDgKyHsxl/nBMqUdxkQRL3l7qT
         01p/DfZgmw3chj4I1COUAwKpatHiBdyDHbiluHwIM3J1+lT2TBihQPpH4w9XuKS5xlzv
         2z+w==
X-Gm-Message-State: AAQBX9cvW7quF1ZqJ/9AozBC2uOrOL1mZ3HkoR2y+3HBlmpaz8vvi4lr
	AH6suFRI6FEhGZk1Fk7RNXs=
X-Google-Smtp-Source: AKy350Z2LCxwbsZczXZhUMn9bqI7gsZsji2sTfNtvM/onEmmX+4IdgIYblwcp5o0hyATcdMWmHkaeQ==
X-Received: by 2002:a81:6206:0:b0:538:5106:b41b with SMTP id w6-20020a816206000000b005385106b41bmr9085888ywb.32.1680802759044;
        Thu, 06 Apr 2023 10:39:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:3249:c5b2:756:1575? ([2600:1700:9190:ba10:3249:c5b2:756:1575])
        by smtp.gmail.com with ESMTPSA id x138-20020a0dd590000000b00545a0818489sm450963ywd.25.2023.04.06.10.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:39:18 -0700 (PDT)
Message-ID: <b287eda0-72e1-3138-1031-76a3e68b77cc@gmail.com>
Date: Thu, 6 Apr 2023 13:39:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [tsc] [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA
 devkit to 3.20 for N1SDP
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>, Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jdmason@kudzu.us>, Adam Johnston <Adam.Johnston@arm.com>,
 "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
 Yocto TSC <tsc@lists.yoctoproject.org>
References: <20230403154306.3422-1-adam.johnston@arm.com>
 <20230403154306.3422-2-adam.johnston@arm.com>
 <20230404000559.GA9226@denix.org>
 <PAXPR08MB6432BC10804AF2B98275C3E6E9939@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230404161414.GC9226@denix.org>
 <PAXPR08MB6432BA9D89EC85F016E440FDE9909@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230405150847.GD9226@denix.org> <ZC3IXbJDPZYoaVHh@kudzu.us>
 <4C217F66-AD65-48CF-8850-78CC7034F21F@arm.com>
 <20230405234414.GJ9226@denix.org>
 <F89D5BFB-F76A-4F58-A894-FD3D28C90569@arm.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <F89D5BFB-F76A-4F58-A894-FD3D28C90569@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Apr 2023 17:39:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4562



On 4/6/23 3:29 AM, Ross Burton wrote:
> On 6 Apr 2023, at 00:44, Denys Dmytriyenko <denis@denix.org> wrote:
>> On Wed, Apr 05, 2023 at 07:20:20PM +0000, Ross Burton wrote:
>>> On 5 Apr 2023, at 20:13, Jon Mason <jdmason@kudzu.us> wrote:
>>>>> At the TSC meetings recently we've discussed the possibility of migrating
>>>>> Trusted Firmware and OP-TEE components from meta-arm to oe-core in order to
>>>>> reduce dependencies on these core components by other BSPs.
>>> My opinion here is that in the ideal world a generic-arm64 BSP wouldn’t need
>>> anything extra in oe-core to work: assume working firmware (SystemReady),
>>> mainline kernel, mainline U-Boot, etc and it will work.  It may not be as
>>> fully functional as you’d get by adding custom optee/tf pieces but that’s
>>> where meta-arm steps in, which was designed explicitly to be BSP-agnostic.
>> Understood and agree. I'm not yet that much familiar with SystemReady firmware
>> specifics - does that include Trusted Firmware? Not so sure about OP-TEE, but
>> what does the spec say about it?
> The very short version is that from userspace you can assume UEFI (the embedded band is more flexible though).  How that happens isn’t really relevant, but it means that for generic-arm64 we get to ignore the problem, like we ignore firmware on x86 targets.

Is there any reason to treat op-tee differently than u-boot? If Op-tee 
where in core, would that help anything ? V86d is in core and its X86 
only. Why are we treating Arm differently?

Uncle Armin



>
> Ross
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1542): https://lists.yoctoproject.org/g/tsc/message/1542
> Mute This Topic: https://lists.yoctoproject.org/mt/98084362/3616698
> Group Owner: tsc+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/tsc/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


