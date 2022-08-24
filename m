Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C558CC32774
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 03:02:59 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web08.6877.1661310177289628482
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 20:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=U/lgk5X0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id c20so11825454qtw.8
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 20:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=2fLa9mcS52ioBDz4qBORZVjziPBQ7x27I0VSC0k78JQ=;
        b=U/lgk5X0qEZb8Ca8ulaxV6wf7+oaFPN8GZ51m0Rhe4HMKcDPfztWR2wfBjJp8BY269
         Jj9sK1gY0jWkQXhtK4GqwL8VWcMxZTltE7UXXZ7lIUCQI/mcu2UCdeU/Du1aDbOxY+R7
         7mGIkaSH5/1XJtVPozUZgAFvEx+kzSEboN4Xd52+U6OAtwHO74qQ2fICAHHBqqbsjbNw
         zMTquPBhZbKaTjhSuHTxLNbEIAWiSL1byQcGmIBCwu3JA8ZTeSFYDWdcezlVDw6cXBMm
         Q823e6NAQaAksY6gAH/I/6TvB7fIHvCEqTifAc/cFV77UyGJVXC8ZzUWD599kM2Q21Fw
         k9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=2fLa9mcS52ioBDz4qBORZVjziPBQ7x27I0VSC0k78JQ=;
        b=ocs8j+KJEiZktJXFjC5ORAZNAKOVlc7YlNElW/eyJVgg/yd7+MHMPQcapFOLH+A+nK
         RqtVci4cYCxOB62S8L9Eurt6367fKz5Qcgw7QHprc7LBoINctDOqQ+7k4u2YDWb4/zQL
         M5ZjYDKr6WGjiyMtkb5cuaE6l9qeaBypSnn4sB85DfYld6OVwJ01T4oSyiJQ0RIdk9Gm
         jBoSTjywlAJkXUEMXe74vhW4+U4SGnday/dzMAmxvbzo3OmOx5UVYzAoqZkTT66T3n+6
         mUK3dH707TOHYnhIeOY4ozRnDNgZ2sWnVFMd5oGG8uIq+VWoaY3TV+68lgcjtKa7JoWN
         4fSw==
X-Gm-Message-State: ACgBeo3g24wHu9Akj3QTeh+TtgYPwqfWQzM7T1HKQCrJ8Rh+gygMtWVm
	b2lQbBu61t9EwLUoPIXy+doD/Z/YNZ6mLZTA
X-Google-Smtp-Source: 
 AA6agR4k5FZEubf4Uo0EIbljURBGJKB+Ebnx9pMzB9VNtX2VGZoU6AfxBy/e4nYp3ml4nFdZ3UzU3A==
X-Received: by 2002:a05:622a:3d0:b0:344:50c9:adae with SMTP id
 k16-20020a05622a03d000b0034450c9adaemr22117719qtx.405.1661310175948;
        Tue, 23 Aug 2022 20:02:55 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 w4-20020a05620a424400b006b6757a11fcsm15047961qko.36.2022.08.23.20.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 20:02:55 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/arm-bsp: Add yocto-kernel-cache bluetooth support
Date: Tue, 23 Aug 2022 23:02:49 -0400
Message-Id: <166131017064.1520857.18306816124979040343.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220823191439.3416-1-jon.mason@arm.com>
References: <20220823191439.3416-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Aug 2022 03:02:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3714

On Tue, 23 Aug 2022 15:14:39 -0400, Jon Mason wrote:
> Add yocto kernel cache bluetooth entries for platforms that have that
> machine feature enabled.  This is necessary, as kernel warnings about it
> not being enabled are now occurring.

Applied, thanks!

[1/1] arm/arm-bsp: Add yocto-kernel-cache bluetooth support
      commit: 0027806b534159ccd35e3e5074b45861eace7150

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

