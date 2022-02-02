Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9172C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 17:15:55 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web08.1155.1643822155018200064
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 09:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=E7sZ8IbJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id e20so192762qvu.7
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 09:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/c1vEuBUJhgSFoquTmB7BvsxF0mACtn4ioBO4xU6hUo=;
        b=E7sZ8IbJNAlWJHj8Bp+oDjhTsjtg+o4T7zmHnEHyQ5r8LkEEvq0BPE+zQdbLtXaqmJ
         n10/+NznPexjXZjiJ3QiJYRTFH6b8Afv9lbcnPI4zZbYWiubi6sn/1tdIXbQ22VBxGnx
         ruthTDCpf1fFj7npeMTbCb3F8Q2l2GI3/uX2Gdk5dgCyllVEAIeaSqLUYbhklGA3WJ9v
         5r3OabUk0J68sifKVllSJhgp4rkzSfC4Dc0ygP8PH3W4BVZPMzHCiRSiPTqhDUtyzycz
         D4tlUNZHYejHaM4TW4t6E5laDUXs/8TBI+bkMaJ6ol5hifZxionxnIXamJ/ZynYPzSI/
         2F5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/c1vEuBUJhgSFoquTmB7BvsxF0mACtn4ioBO4xU6hUo=;
        b=gso02OErVZvQxIZvCQA2McHADrLEX5i9moqys1FKnIH45HabR8BG65lq20vuilWnk3
         N5FWVs4AKHA+CR3ZuEWloHX69Dsq2D6cnEdcZwnp5/DnEv5OCEzK2e+etLnSRQE6s7W/
         9vmTDX9j2B0TzOTMSvERE9cGeR9zUu2uX3tay9uPGltRG9gGr3qmv5z6IxGyYExqZ6eH
         pxxr31yE3C/UOLwRZ0ezs7tvpBB8cH8dr3sij9E7ZB9lsDlcgXrzuF+SsXsNIvaUEAXX
         O7HabOdpY/iW2cgNn/hKAQqwGX32w8JLUQCDqOt/ycfJCNs+hGEfzKQ1imTN3VzI1TYL
         1LwQ==
X-Gm-Message-State: AOAM531pkNdWkOHXj+D56wKxeTC4UIh/CSxcw6+QGBe39XnrDawmMNLQ
	GeT7v0l7rWI/FqYd7CHcs5UStRY3LIKgRw==
X-Google-Smtp-Source: 
 ABdhPJyvEo0fwDBe0v4E0D/v5chEyiRoI8bTVhnYCfPeY57b99Yx+mljtTLel0Yo0jRx4PRRmdrokQ==
X-Received: by 2002:a05:6214:c2a:: with SMTP id
 a10mr27401257qvd.42.1643822154059;
        Wed, 02 Feb 2022 09:15:54 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:5bda:8ea0:4f3:121a])
        by smtp.gmail.com with ESMTPSA id
 bs8sm9175497qkb.103.2022.02.02.09.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 09:15:53 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Sumit Garg <sumit.garg@linaro.org>
Cc: daniel.thompson@linaro.org,
	nicolas.dechesne@linaro.org,
	ross.burton@arm.com,
	ralph.siemsen@linaro.org
Subject: Re: [PATCH] arm-toolchain: gcc-arm-9.2: Fix mangled patch
Date: Wed,  2 Feb 2022 12:15:43 -0500
Message-Id: <164382214341.1445076.350251149155239803.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202084955.1644906-1-sumit.garg@linaro.org>
References: <20220202084955.1644906-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Feb 2022 17:15:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2941

On Wed, 2 Feb 2022 14:19:55 +0530, Sumit Garg wrote:
> Apply commit dce28d8ac7fb ("gcc: Fix mangled patch") to
> meta-arm-toolchain as well as it fixes a build problem when trying to
> build kernel with gcc-plugins support.

Applied, thanks!

[1/1] arm-toolchain: gcc-arm-9.2: Fix mangled patch
      commit: 75e7f371f5384d978d741878573a65f2177d2904

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

