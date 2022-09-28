Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37ABEC32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 13:42:19 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web08.8073.1664372536830906200
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=1mmVyJvr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id w9so2296942qvn.11
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=kODtuvEUPXmmXxCQm9JZ/83cOZSZX4fabrye7nCHChw=;
        b=1mmVyJvrK/oi21Gj2Rqv6U0TnpKgYFA62AVHQ5BB0kwMNtzSZsrRT2Qgr1Ns+E/iGT
         eHzhQbYY5f+Pcg+QiGT450oujuOFrZ93jE/SiD2JJCXShJcaIXwzd5RXDuTeTo0W0IqH
         pQz8tAPPz6XfsbNInvYGRVYF8GSUsNgwBg8Rz9FqBWXBbFNz3lYL6zx4+ubTEy3vbzUu
         as536gJvpo75VYVwqLnf0rcZCKABsd1bmXeAPrN8TKDJbHzqqjurBYMn2jbYp/HdyxWT
         SmwkDl3uDW/eja9+UYnNhBHGjOsrucOh5JUiN/rIh2tUamEz38YyAXxuar3yrnkRb1N+
         CdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kODtuvEUPXmmXxCQm9JZ/83cOZSZX4fabrye7nCHChw=;
        b=bjTfqt3HB3H57GibgMd72kt2kLj2eOHsjnYDZSHAvl9qTeMSSyvF16H3yu/0zJfRR4
         3eERQxoOP1w8ga3HFKvwkjt47SH647w7Tj6t3Zn9gFJlAKaRn4COIildO11ceSlShEHC
         EVmFH3+oagqV8AvuymZtmd2smJtua8uSqGRFPZWg9Loexf3BVXdjLQgxMt2ivVUy7hRx
         jltsR5i8cKSsS8ztNihK+UgMbWyPaxK+IxkVo9H6JDMwbxzcw4D75ltnrF4buIxfij2+
         3yOSRnUAzRPp/4hX5XhmTx6Ru2ukuI4Dk7EabraaQzHKhlSER8HMSCDwDmRrYG34sfuQ
         sdNQ==
X-Gm-Message-State: ACrzQf1QGOgcbrHZKYXIwe6AwI4c/OmB+d09YLiVv2DP2cGcCyVqTOO5
	Bg9NvPFQars4Uk64XIJmXQiw3XEEMHBP5Q==
X-Google-Smtp-Source: 
 AMsMyM6uKyuGFT69agK/xpvJ82IscltCkSuHqn6x62a1JZ4QVu2rZCMcshNM7pPxbkADQ/Ucp6oRPQ==
X-Received: by 2002:ad4:5d67:0:b0:4af:a14a:ce3c with SMTP id
 fn7-20020ad45d67000000b004afa14ace3cmr603606qvb.60.1664372535532;
        Wed, 28 Sep 2022 06:42:15 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 r13-20020ae9d60d000000b006cf19068261sm2290081qkk.116.2022.09.28.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:42:14 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] ffa-debugfs-mod: Exclude from world builds
Date: Wed, 28 Sep 2022 09:41:59 -0400
Message-Id: <166437252283.2315819.2265944562283295603.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220913063727.2748504-1-raj.khem@gmail.com>
References: <20220913063727.2748504-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 13:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3855

On Mon, 12 Sep 2022 23:37:27 -0700, Khem Raj wrote:
> It installs arm_ffa_user.h and so does arm-ffa-user recipe, lets not
> build ffa-debugfs-mod in world builds since it does not appear as much
> in other package dependencies as arm-ffa-user

Applied, thanks!

[1/1] ffa-debugfs-mod: Exclude from world builds
      commit: a0658a6682a537330f5619962504e675d7540f40

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

