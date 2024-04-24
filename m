Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1297AC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 14:14:37 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.17448.1713968069184507560
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 07:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ErYvLio4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78f05035f56so436662685a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713968068; x=1714572868; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNSK3aejU8Gk1HxKw7kIplqwHgclf2KoCe6DU0IOLoY=;
        b=ErYvLio4tJwFPPVK+AChO1iAZxmieUhKzm7ztmeKtzdZOQaaYUNJQfcFkCQeBxcHWI
         2Ml7+wZDotLY+81Qehi9NWjubJMKZIvmS4u3msQC4/n/jpZoAbpRUxqFzDB4zDVECOkf
         Z4+x/9fmtc0qf4clT5NSemS+snxzjrdl4wtb5xQ2E+C3+PkOr1RRPPMiYITTPFaH4K6V
         zCftkbWllfX/MAVDse0Wx0oU651E9ixUXeA7IRdc2VKKKCZgZ4ofkc55eBVmqK7ODPld
         DDnOi1Ap0frTF0x1tKyYoq3MdN8nxwgdUwygtNd2MDReDJL+HvMSSvbYZkfH1KQ3F6G/
         vs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713968068; x=1714572868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNSK3aejU8Gk1HxKw7kIplqwHgclf2KoCe6DU0IOLoY=;
        b=hn9hJ5SvnHKyqpnVVZrivatcmqaMhg0kUVn6RuXqTmu0Zv7rpGc+OcFBQ6ZcoWtaBk
         +iUS5mIGBd2hr3BPiNZ4U5XySJ9DT0LMNR5W5i0f9EPDxAM7vZDDmfNfM7cm1KJXv6Ls
         8k4uJQC1DlaWqNay0wDfUVt5uRVl0xF0pJ0bSF2G4o3njFrwVWovq5ZEbU0i+6ZPWBnL
         F6q+0TT65DyCthrGEF0EfHuZtr5YXnnYgT/OIl2e5KrbLVPotLci3PM3lGo8+9IMnhqZ
         6yrap3lCTTCnVLdPMpAZ+hBHkB0K3PAnWqBWZ5Afg4qug2oZs25qvIhqeD1Uvk0LeLyu
         Qv/A==
X-Gm-Message-State: AOJu0Yx5ebqwslhJ5t9WsjKfQ3RJ/iIfhaun7bGaBYnE99jdFP5uIfLw
	xw3hYO7cRjn3aX4M1NjsVnKJAPe71X8XRAE3BNgop/qOyO9EyLpSPCro23PCnKyvzLYSN/fccJ0
	=
X-Google-Smtp-Source: AGHT+IEZpD+8ofTzS694xZ011PRCerj5iNQoky4Ni3OqFb1Y+vPZde5pQswRwPYsZfdpF2DePgwIGQ==
X-Received: by 2002:a05:620a:907:b0:78e:eb47:448d with SMTP id v7-20020a05620a090700b0078eeb47448dmr2763314qkv.36.1713968068028;
        Wed, 24 Apr 2024 07:14:28 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id y12-20020a05620a09cc00b0078d4732d92fsm6120734qky.115.2024.04.24.07.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 07:14:27 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Gyorgy Szing <gyorgy.szing@arm.com>
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>
Subject: Re: [PATCH 1/9] arm/trusted-services: Update FFA TEE driver to v2.0.0
Date: Wed, 24 Apr 2024 10:12:26 -0400
Message-Id: <171396794990.193657.9161749010995567074.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240423163205.5885-1-gyorgy.szing@arm.com>
References: <20240423163205.5885-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 14:14:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5602


On Tue, 23 Apr 2024 18:31:57 +0200, Gyorgy Szing wrote:
> - Update driver version to v2.0.0
> - Follow up the name change. The driver has been renamed from
>   arm_ffa_tee to arm_tstee.
> 
> 

Applied, thanks!

[1/9] arm/trusted-services: Update FFA TEE driver to v2.0.0
      commit: 97be7e3fa3175dfb05fb82e4dc8b6f3b756326b9
[2/9] arm/trusted-services: Update TS to v1.0.0
      commit: 954975813ac7759ffab9760446f176930d90d29c
[3/9] arm/trusted-services: fix MbedTLS build issue
      commit: 7f30d19df1f5fef12639b909ffb1482fbbcce40d
[4/9] arm/trusted-services: fix environment handling
      commit: 34f1c740923fc9eda6732c74d63f4d624f49dce2
[5/9] arm/devtools/fvp-base-a-aem: update the AEM FVP to 11.25.15
      commit: a130541e92578eaee7cbe8a1e4ade9b48b134a15
[6/9] arm-bsp: enable Trusted Services on the fvp-base platform
      commit: eeb6441ac6a254a43b2a3ac7306e5e7430ba2e37
[7/9] arm-bsp/u-boot: corstone1000: update TS RPC protocol
      commit: ecb0b05148718695da76a3450c1ff6fe6cae6981
[8/9] arm-bsp/trusted-services: rebase corstone1000 patches
      commit: 75d6fc191656636b93962f34a1f37113c57d6196
[9/9] arm-bsp/trusted-services:cs1000: fix deployments
      commit: a1b5347b391b640c3bb7b329acc126fa8af4a4f4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

