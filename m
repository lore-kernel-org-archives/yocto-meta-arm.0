Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7CFC4706C
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 20:27:32 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.27904.1704832044092376652
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 12:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Jxti1yXA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.41, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6dddba43d70so1009986a34.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Jan 2024 12:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1704832042; x=1705436842; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAbqgHe2HrXWMyr/VylQA+TYoJ5F3/q9ffezplxJ7Mg=;
        b=Jxti1yXAH00ZEkfsWvlcYxA2MyiZCW8j0BHaEV7/BPVTjYvNYFV/KJHUeKSA9H+7lU
         zGmYyW9VvAVVTKCgR1ewZKcr34ZlHQ7gOSwPhBl6tNH8MVzrbr3/HFe39T1dxyDh1zP4
         ofenIUqcg5OXhaepCa46q4NOs/Qel5Nfk7K62RY1nnU/R6tDXyYksfhdiPO7bzEL6Blq
         oymrSO3cSfomi2ZiHKSCVV8xFOVsot1jF/My4mEXlA/afOIITd3Gw+/A/Y5cmugKEsv8
         NDP49U49hAU8U4xJHns2e0H48egzNAsqEUONO+EZh63h/j0kjbOeRGZYkPRx7hM5atY/
         p92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704832042; x=1705436842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAbqgHe2HrXWMyr/VylQA+TYoJ5F3/q9ffezplxJ7Mg=;
        b=PUnlxpIxR2qh3OUrQ0BCb/Za2onxHUp9YRoeSOlwPKMzl1U+qyfDGf+bgEk0ECLKVd
         s5AbhOQzJHmGLoX1xfXsd6SRXRZ6FuGOxGGxlHEKCkxC+EZnKQkXKMTYGXcwsHU/+YjI
         8fXn33SPiQS1s1BVSTFRembVBwcdWIW1ZpxfyPNxm4+Q8d9Aa0syxBzi4pB9iuEw6gE6
         QRlWkaaacTJ61FlcX+FshPwFgrp7Qty9MBbE2R0DdBo2oTxNlmV1tbUPFBHGk+PBqmfJ
         JvT32ULv66YkgicRUz4v7nO9JdgT9K7kj/jfeAZS4bKkFcY/+ZF9SijB4Nd0wY+jPrfQ
         y/DA==
X-Gm-Message-State: AOJu0Ywte3D0HFZ/euUQHXUkUsQQSSFY+E9v3zxbyBDvHFwItFR0amwC
	717q2tZRFzZMvBhdpLBwNJxCfvOZuw+fjK1Ti7hoIPoufA==
X-Google-Smtp-Source: AGHT+IHLvo1i21h/HpmzmX5GT/JOY08GfJFTohBlBwz21/CbkTo8Mrj2RJGg5Do46NehAr3MmuEwDA==
X-Received: by 2002:a05:6808:ec1:b0:3bb:cfcc:39f2 with SMTP id q1-20020a0568080ec100b003bbcfcc39f2mr6296055oiv.89.1704832042371;
        Tue, 09 Jan 2024 12:27:22 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id h5-20020a0ceda5000000b00680b34d52f8sm1163156qvr.13.2024.01.09.12.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 12:27:21 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/optee-os: remove unused 3.18 files
Date: Tue,  9 Jan 2024 15:25:34 -0500
Message-Id: <170483193676.2807920.3651367477305510.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240108211846.29349-1-jon.mason@arm.com>
References: <20240108211846.29349-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Jan 2024 20:27:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5327


On Mon, 08 Jan 2024 15:18:44 -0600, Jon Mason wrote:
> 


Applied, thanks!

[1/3] arm-bsp/optee-os: remove unused 3.18 files
      commit: 0d71ca11c61583debcb236d5313d3dc0d6531314
[2/3] arm/optee-os: use sysroot in CFLAGS
      commit: bcabc921f6c35d297c46981e14265d937eae23b1
[3/3] arm/optee-os: remove unneeded clang patches
      commit: 2f9112a8fd9c754248a8fc573b46491068b56939

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

