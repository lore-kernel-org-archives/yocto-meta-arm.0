Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287BDC433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:50:58 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.8036.1639147856683609672
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 06:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=pd1qldTM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id f20so8578923qtb.4
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 06:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=geh6SYffQifdtxljGsOwqTitvaXpC16ALe9TVTR1siI=;
        b=pd1qldTMhfLkQCvbj6gPLl31zLZgU3ajem9GIfp/ztpWwGzdD8taxWCF471NgE2eIY
         +a4kTidb5HSJn0JH46V29fRUMDyggedOv8d8UQmtEwFTKQLy+zuJ7/dwLcL1Oimkkawr
         +q8vO3922kaWmAvuY6xjQ2IG+EtlfekvTxIbq417fRQbF3WqKS/yqGgJGzZgTqkhQcxU
         lKnqsGdxS3/FGFRfuRLo7hYMjgSZ6iuaxt6cmQXiaGksV5gY+DcjP1B0xUy07DZ9/bW/
         fWrHju2bJwkcesLFi7oWB5qgUWmSd9rV/Cz53FW0Cglnx/Q/1qPEXBABpeZbEfrgUbQN
         PRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=geh6SYffQifdtxljGsOwqTitvaXpC16ALe9TVTR1siI=;
        b=HQ/C903HAhBgGt7V6ZwpgTMB0tG1a3GloqXim4wD4HYAaumCwl1E6kvbb8bEIHEzuf
         w7TuBJwDgf2iMvJ8vfQshsaOux1gSegSQvBoka0PhpV2yOzZtxSdPiWF/sbNanHGFuK6
         onGh55AU33dFNlycGlpiA/O8qIPflaefUDQ++HGePqUxvXwH+GYEW6Vi7xpD2ruRdngn
         h+d+PI3cqxs3e0E/NsIBV+Br2qTaQY+DsbvuHDRNT5zRtbZ/iczH8rIW1tigHQfaDhPb
         5fUeyh8ezDo6AumH9aLtY07q6sahRJwF7aY/9u6fFpPs+GB4iNqgWsJVSS0IYjbxcL8p
         KFng==
X-Gm-Message-State: AOAM532bKzf1un0muTBNdLn1eVrTOjt3xM6S/JDv1kqsFoLjkK8iIzbu
	D3+OzqktLK+3JeXffIyVfI2IJD/f7gyOWg==
X-Google-Smtp-Source: 
 ABdhPJxZbvv3PXuNXC+BqbAzjUHhLIBNYb1GgZv/G/dob+E1uhLlwnz7Lsg7szzsX+jVDVpbw9p3pA==
X-Received: by 2002:ac8:45d2:: with SMTP id
 e18mr27255374qto.112.1639147855694;
        Fri, 10 Dec 2021 06:50:55 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:8d70:388b:b90b:fb51])
        by smtp.gmail.com with ESMTPSA id
 f12sm1321194qkh.22.2021.12.10.06.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 06:50:55 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	abdellatif.elkhlifi@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/9] corstone1000: secure partitions patchset
Date: Fri, 10 Dec 2021 09:50:47 -0500
Message-Id: <163914784919.9919.5893582334851241252.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209191935.26017-1-abdellatif.elkhlifi@arm.com>
References: <20211209191935.26017-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Dec 2021 14:50:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2612

On Thu, 9 Dec 2021 19:19:26 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Adding new  features to the following components:
> 
> u-boot
> trusted-firmware-m
> optee-os
> secure-partitions
> 
> [...]

Applied, thanks!

[1/9] arm-bsp/u-boot: corstone1000: setting the boot console output
      commit: 3fe3273198c311b5ace972a9b66a1184b63f3083
[2/9] arm-bsp/u-boot: corstone1000: remove the use of fdt_addr_r
      commit: 60af6f3745805056bc2da9b3d5aaaf162733f189
[3/9] arm-bsp/trusted-firmware-m: corstone1000: Aligning with TF-M master
      commit: ab339b24d49736d01aff562e30d28e387b823755
[4/9] arm-bsp/secure-partitions: add openamp rpc caller
      commit: 4c8b25c317969453d330a3917802968f2766a441
[5/9] arm-bsp/optee-os: add openamp-virtio
      commit: d248aa2a707912a61f96a160366d57c0c2f1ae12
[6/9] arm-bsp/secure-partitions: Add psa client definitions for ff-m
      commit: e038575aa57d9510b7f16e0b3b47b76df12cde42
[7/9] arm-bsp/secure-partitions: add common service component to ipc support
      commit: 31f5df490dc33c5094ff00f58862fb2a7fc52e6e
[8/9] arm-bsp/secure-partitions: add secure storage ipc backend
      commit: d411433a1100cd8ffbc99e112b5ccaa6213a7997
[9/9] arm-bsp/secure-partitions: Use secure storage ipc and openamp for se_proxy
      commit: 7a6fba6e54d259c692dfb73f2a316e129452b6c8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

