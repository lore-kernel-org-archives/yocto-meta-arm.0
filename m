Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65266C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:53:15 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.12120.1642773194136433979
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jan 2022 05:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=i9HXKJ4/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id c190so9881325qkg.9
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jan 2022 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ULRO2Nzn1cDT9X+oxABqz2CrlpsJAUgA9Fgd3zzuLyQ=;
        b=i9HXKJ4/5KeNfOJ3x+HVo1IVp163FMJb7VoZ2MWBDRsjPGkCMjRknau44a/ZZgk8J/
         BaQ9FufmlIA1gXyOjfVTXe0wqIN84LYBrCFiBqLZfELd6DYDV4ohep0SxXTJmZMYw9By
         rVXxtFhuNil/PLUZPgzx/kKOviI8y4eCMkrMSdtbVrFiyNR8Vjjq6IPGb8X9ln1rtZ2G
         N9TX2K5LVU7NdsbS0PF8DO4NI0zKBNpi9cCIfftUocV8pp8i2ZasvZaZ19kEUFp4B90j
         S7rRMZv/K4dKctMjkJ2sQuqh4VHSrg6ly2Rac06VRGwzSvnT35Qxz0BtaPnNBd82uG1l
         sNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ULRO2Nzn1cDT9X+oxABqz2CrlpsJAUgA9Fgd3zzuLyQ=;
        b=fEV1RueJbEzrqO3LahU4qAJWHCXZA0Hxjwm+vW7iP3PBHEEDQHvnyVc5ElAGTEVrrq
         aC0qzPXlTnOcTuw6902T1+e9jQzq3ujz57FUozbAOPUf4L4PDLtGoHJxOY8G3Z0okIJO
         QzUjiM7/UQ/iVaXtGoKoF203fIX1nQV6V3KaRotcws1YLyGQquJpNgWDPr1OXEox03tF
         shmtb4VspvBoWdqf7LjY9Y5C7D7/SCYH4gFoHT0zN/sFXlhVlJ1srjNueUHd+34zpPm4
         QZ/rT93KTYxspfg3zvgcGEVu++bh2FZWogm5eqMchMveLMONl+QeGsN1xiBexpUYc52i
         CKhA==
X-Gm-Message-State: AOAM533yOhAeAFFmaei5H2d4iT8xm7Ai3hl7SDbWaLlPHOeHRVV+Mppk
	S//DAA1LaTsuKc0biOEcQWEVWRq43PIlIA==
X-Google-Smtp-Source: 
 ABdhPJxMUvGztwmBvE1tJASg7Sfcfvs4lA879ciNlcDnqw3DBvgNpLeoCfv/oNJPqTSb5M3fqKU3Sw==
X-Received: by 2002:a05:620a:4016:: with SMTP id
 h22mr2715953qko.481.1642773193205;
        Fri, 21 Jan 2022 05:53:13 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:a540:2d7d:9b0e:f036])
        by smtp.gmail.com with ESMTPSA id
 bp40sm3000387qkb.68.2022.01.21.05.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 05:53:12 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm-bsp/optee: add patch to support higher DRAM on TC
Date: Fri, 21 Jan 2022 08:51:20 -0500
Message-Id: <164277307995.3864949.8224508587663620400.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121115643.485616-1-arunachalam.ganapathy@arm.com>
References: <20220121115643.485616-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Jan 2022 13:53:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2890

On Fri, 21 Jan 2022 11:56:41 +0000, Arunachalam Ganapathy wrote:
> 


Applied, thanks!

[1/3] arm-bsp/optee: add patch to support higher DRAM on TC
      commit: 2201fa268d6b2184e60fe8e8f5e1c25b6858ebf0
[2/3] arm-bsp: Set preferred u-boot version to 2021.10 for TC
      commit: 88334e166432e7bc5fd7f857ade8f59aaecabba9
[3/3] arm/u-boot: add patch to support higher DRAM on TC
      commit: 5377fb7e096290d2c05ab69032ae6b436c5f9358

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

