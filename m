Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96DCCD342C
	for <webhook@archiver.kernel.org>; Sun,  3 May 2026 14:32:10 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24598.1777818721078070366
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 03 May 2026 07:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=gNj0NLjh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50fc496c8baso30610431cf.3
        for <meta-arm@lists.yoctoproject.org>; Sun, 03 May 2026 07:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1777818720; x=1778423520; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTDNayyPSVoJxSUvt72LN2hnpXS53ZyHmhmYiIrSsyY=;
        b=gNj0NLjhb19n4RCy8r7Lhu6S/39m2Kz/tzEzXAX2AR/Q6CEkAYVoCKpFXNjPQxIgKP
         dLp5XAK6EzXnxXMPYzkp+cRfMQZ2wzXK3Hxg6f8FMK67j+LVrXee2naAS481edNdEXrs
         G6s5Uq/p5tEWVb9Sk7KbOvXUp3INaUmZVBmk2Lp4ssnZ60uvN8yObp8hJcoMbSHk4y3N
         fpJScQkpV1skYy9WtC8zMoxXITo9US3JksBBlKyqyegy58UbYddokozmBM0qQwT0kp33
         LBL6EtvGXsmlLuc6G4T4k2gU6VK5F95Apiu1AscKNhiQnqL7J1av1QRk4F/U5O4md3uG
         IzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777818720; x=1778423520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CTDNayyPSVoJxSUvt72LN2hnpXS53ZyHmhmYiIrSsyY=;
        b=LhlO+4jG224sNDlywuQgehB2Mkg+oInIczY539q3dkn5iAVC74hFQWjbn9MQV24Ed2
         qQxk9ECMym4omCoS92IMMjTK6rWLX4oQmHcNTgRB7rEIcgPMoDLCYo8QqfcoJKI52nMJ
         MlDWTVY2sE3WfmMMpdVIHw03S+DXhF4qcF4CppCqHwXL8Ux1Q5aJwPKd2f5WMWDcd/X5
         qmceZpIXNQ7DQ0eLuX4GRpZTNr+V9xj6dpl0iuWUuNwbbZcs96/mSBtpMVz9l8iaSUqO
         itGoCG8VOsQ38Mzr6Wn4UnNi3Jtg/cOpXG0qFMneqAzn5nZn3ibOzLisfjIFW2tcNvZG
         ESKQ==
X-Gm-Message-State: AOJu0Yw19hXwwLBF3fbmovcSjhRsCy4h/mO1MwV/2/y/6O2TsZsJZ6ue
	jU+bqXTIYz3xAkHz/7jxViHr++CkAusGm730J7szeQmuIDaEzFKFQlqrD//vInKKzdmB7x1jLgn
	Q+sE=
X-Gm-Gg: AeBDietT43MXkhXMgCeSQIe/Tow9zxbXtIsqPwkBL9Hm0E+bpgzGrB+1wP8gz78OEqm
	VWdheXug0LakpGIYcRG1b9XUmascPdBXiuQCxdhhljXtYmzZINy6i2pXcEKvhmJO05BIOryEs5Q
	nM5YHUhbyEnHoEl36BxN2Q+wSKOwrLvwGV4qJGmabw7X1EC4N8UbKFKHz5mEjCYkU1NCtpUt9B/
	zOOzYnMe+Pj6bd0ihaWgkfOmuBQMU7t7PorCTliw18G4D0Pn9vBxNlR5fIYtEfh8c54B2taReqI
	5L8/bbfHwT5RBfaHGODqsyvLHdLEFS1GucI+spnF0s4XcnE1UmwOx1Prrl4rh9crn+VlhXysrtq
	R5xkBo1M/zxx6oUv3Y0i8ftP9XL9Ax4/IhNHJuyqcYgf2rfEjrdCN41LKtCbcEeSouqOA/9mq8B
	pl/sEwxRm2THWTRWWzIQNcEe0=
X-Received: by 2002:a05:622a:2295:b0:4ff:c17b:5ab0 with SMTP id d75a77b69052e-5104bddbcccmr97172161cf.9.1777818719715;
        Sun, 03 May 2026 07:31:59 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040927789sm71723081cf.11.2026.05.03.07.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 07:31:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/u-boot: Update fvp-base, juno, corstone1000 patches
Date: Sun,  3 May 2026 10:31:50 -0400
Message-Id: <177781871147.1774488.2789535598361671636.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260501132822.2152-1-jon.mason@arm.com>
References: <20260501132822.2152-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 03 May 2026 14:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7033


On Fri, 01 May 2026 09:28:22 -0400, Jon Mason wrote:
> Fuzz detected when applying patch.  Use devtool to update and clean-up
> the relevant patches.
> 
> 

Applied, thanks!

[1/1] arm-bsp/u-boot: Update fvp-base, juno, corstone1000 patches
      commit: 41bd664809669bf91147abe69be14bfcf43133fb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

