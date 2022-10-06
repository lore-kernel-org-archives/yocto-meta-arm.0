Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B49C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 13:12:08 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.5561.1665061926107749349
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 06:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=tUSmOoAz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id v17so946791qkv.5
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0B7B01qaileAxM1w8q3W2fGXQlwsHlrQYAGB6+zWlAc=;
        b=tUSmOoAzholo9mA0rmdDc7Dyx0QtA4EgK4RIPkVo6BMfcifKUNH+5J84glYDNZ/jAm
         zR/lM0KAbC+/Y4C79mGx4zQ53OkR6yzmlFT5uX82ttPwdqBrKgdwgBa69aTGqLZmwzK3
         zq+sNmh5flr2t+AIVb21dH2CTBmnVcBski5FOLPnELiDwnDEIK42svcpodHywfq8u6CP
         hFDfXXk+QmAzs92uRxQvo68C78fRV5Kr6Zu2Dfu0MJsqXbMew2LVDzX2+Gu0bg0+TDt5
         f+2F2D2Ct/9DLT/VnWN79V3CmTZwsFpjVaScFPBJ22iCGMlCKsWPm2PBZ9usl9h8Wd4e
         ww9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0B7B01qaileAxM1w8q3W2fGXQlwsHlrQYAGB6+zWlAc=;
        b=371GdEipjLnkqUWPIRMOe1b6XXtt0RHeVPt2V0uTls/BAF/ZtjiEKRZy/AnSyvzXZ5
         fCy1LywsIF9Zo78QPlyWdo6zkYp5rcaG52RV/0OgvU9WtUpi4w/Jhmz3dDGMlqar4y66
         i3SqO6RXHel+imAqXNv1VLgyliKkPGrxLqYD8waLmbztgp2hn5WLX553hMXu3mlt7TDZ
         6ZslZkpqiqtsmm16MMS95NhTzZfzCN8F79yGZ08uOlFRurXhc0YMtU8q2K0FJidRX/cK
         NdtoSKRE93sAk1mt/N5qiV0FYLD0MmYJ3VWTf21jnCCZhCmPfnevu7qBAkAfQGaUeDsn
         MoGw==
X-Gm-Message-State: ACrzQf0Yz8Hu6GfeEuHiy1v/u+agWe5UV0FX2g22MdWQMjQjbg26kTk/
	gULq5ts3EZsI8RR/Y8ghSzgFbSjNONl2AQ==
X-Google-Smtp-Source: 
 AMsMyM7Jnnc3if79B4s1Tc/dJehhqxywTJoxgk1euW1s8v4YhNmO7Pr3LpS8glVKfu7sQT/3cBgpWQ==
X-Received: by 2002:a05:620a:c04:b0:6e5:9234:90ea with SMTP id
 l4-20020a05620a0c0400b006e5923490eamr1831673qki.360.1665061924714;
        Thu, 06 Oct 2022 06:12:04 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 q48-20020a05620a2a7000b006e702033b15sm381073qkp.66.2022.10.06.06.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 06:12:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rupinderjit Singh <rupinderjit.singh@arm.com>
Subject: Re: [PATCH 1/2] arm: update Android common kernel
Date: Thu,  6 Oct 2022 09:10:50 -0400
Message-Id: <166506184998.2228383.9772083315083567844.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221006100249.1557942-1-rupinderjit.singh@arm.com>
References: <20221006100249.1557942-1-rupinderjit.singh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Oct 2022 13:12:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3943

On Thu, 6 Oct 2022 11:02:48 +0100, Rupinderjit Singh wrote:
> Update ACK to 5.15 and remove the 5.10 recipe

Applied, thanks!

[1/2] arm: update Android common kernel
      commit: 3921257e9bf3e0cf2663e3df1fbe55b6722ff892
[2/2] arm-bsp/linux-arm64-ack: make it compatible with gcc-12 for TC
      commit: b9073fdc997470e128deada6b8c8046e6d738ee6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

