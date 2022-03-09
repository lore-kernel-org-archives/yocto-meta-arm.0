Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3027C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 19:01:02 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web12.562.1646852461667751577
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 11:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=a98VLXV6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id a1so2678834qta.13
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 11:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xEHMNPyQ5C0gvYp8+l6tkWOXDX7Ny1Hw0saXP4ngUSs=;
        b=a98VLXV6IEOqRTeqb/Sx3xhQPAvQvbe8m1pF6lg/G4rqtiLEgpnsf/tbmZo566oyEC
         5+/3Eo7KvxhBvCUmxOBkk0+J9XkarFTsnEb8BcOQ500PeTGo0SBitRhwRewhzr3F+6a6
         5kZ2s0sgfICZJBAMa3CqwAz8LQeaUnwSz+HSXx6TdxvTnUObRKr/TnFyE/8Tq8TMMMpR
         aj0z33dkfBt1vK3prUf6cIBeaUW+yD2Dg0/U/UcOZyKQsqDnvAxzWQpcFJ5CZdYHDKCV
         zoC2slz1MgZ94VX6z4SDwarTrTXdGrsImCTCai0e9E2QUI667/myWk+eODzgOi5mlM1i
         V8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xEHMNPyQ5C0gvYp8+l6tkWOXDX7Ny1Hw0saXP4ngUSs=;
        b=os1kmO+OBvddAJYNvQF3pKm6oFM884HT+3D1gs+ZNR1p8e4cJvDFed58/NEL6TCjJJ
         DCTXFlrtz9AsYWA8ctgVMrSp1DXF6U+FJI3pB7M58baKaNrtpfegCwmTqZEuxIxAEdUB
         fiuj0bO6jv0JggxUgpSf17wW71rxL151Bgu0kOqQTEn4SS1AGbt9u/2X0cXWUecYUicM
         0htnQI11S1xHsvdEIiypCbqXsHuBf7fEJGQhYwfFl3/OVcDrDi49R001g9lLacR1FxnQ
         8/XP83qBY8/2nL+t7ak+I+Hj5cUKqvt6o9KYANlmZ7e63euM5BS7l1Z+9rWNBaxhSqt9
         YhtQ==
X-Gm-Message-State: AOAM532/Xsg0YkXbxCC2bFLf0EIEwMwhCO9njcFF2LdPxpJwKYZ5s8LQ
	gbdEpSyW68OumaCzaZ0kn7eu7SuBSXk4eg==
X-Google-Smtp-Source: 
 ABdhPJyViO82FbT7S5gI2fxm4XQBwXyZz4Qt/PaIAxs3AcLJEMhpE9IcgX8e8h3mp2Il6DqW5wCsMg==
X-Received: by 2002:a05:622a:14e:b0:2e1:6a95:3b07 with SMTP id
 v14-20020a05622a014e00b002e16a953b07mr966236qtw.285.1646852460455;
        Wed, 09 Mar 2022 11:01:00 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:3ca7:c4b3:8bcc:39e7])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a05622a020100b002de94100619sm1762401qtx.81.2022.03.09.11.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 11:00:59 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"harry.moulton@arm.com" <harry.moulton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH honister] arm/fvp-corstone1000: backport: update to latest
 version
Date: Wed,  9 Mar 2022 14:00:53 -0500
Message-Id: <164685245319.605244.10739693187527300134.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220309092602.982867-1-harry.moulton@arm.com>
References: <20220309092602.982867-1-harry.moulton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Mar 2022 19:01:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3141

On Wed, 9 Mar 2022 09:26:02 +0000, harry.moulton@arm.com wrote:
> Backport patch from master to update the URL and checksums for the
> new Corstone1000 FVP version 11.17.23.

Applied, thanks!

[1/1] arm/fvp-corstone1000: backport: update to latest version
      commit: 6dabbf15423879593e45f958466717318997f85c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

