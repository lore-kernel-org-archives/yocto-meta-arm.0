Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC61C77B7A
	for <webhook@archiver.kernel.org>; Sat, 10 Jun 2023 19:34:41 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.23928.1686425676714334037
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 10 Jun 2023 12:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=VD9lQAAo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-3f9aeba6cc4so24080321cf.2
        for <meta-arm@lists.yoctoproject.org>; Sat, 10 Jun 2023 12:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686425675; x=1689017675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4UgZbczwpYFX8A0yt0V5Fz6uaiG/05n79XFVzyDKbM=;
        b=VD9lQAAonPMO8vErXJqt1kHm6QLTm63GfgJk9/aQ9QsHK+rg1IhYIC50w5T9criHd9
         njLiNndFZWSlKHeKGfrAzTVJTgbxqZHzsIBJq80QVqBA5++iAUWOR5wUqffG6mXtzB9o
         VCJarvOfzLkeJmeya9imLrhVUn6sbqLBKgvXppHTumnIe44TyQeyIhxa65lNY1LcshkS
         L920BrBcbDJ6LXKbeYW7xeSeDAEhZ28WcqeaYspXybkexLOwpsg6vj5KQBp4AC5N5Rgy
         v6bRxiK/2FnQk4+hiyM0k2w9UA4Q2sZ0VnWe4LxP4YstCfAafSRlAIymYjb59806hC38
         q+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686425675; x=1689017675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4UgZbczwpYFX8A0yt0V5Fz6uaiG/05n79XFVzyDKbM=;
        b=PHBPGX2jpvQs8//ahrMoKuhXyVE4fCMSosMyfN7brensLUsyfhILD6mg6mvVLKW2nL
         DztFVOAFg6TURWfF/IoNj9E5UN10p1gxN5+7QBqkmVDf+GoXYyoBsKf64jpnJ0yvm7EO
         auNtl1sCEebGJPKRkj6HeZsF4byg/MM86ReYKDLMJNui3lCWVKdpXDqJf08rvpd8J0bA
         tBag/ycX0d6cRDFhLlv48awvzeIQcJUwPL+YejmFGYZH+D8QbP6Fs96tR12sR7sd4BSA
         mSxKZQ85M6bwuTJZEA5Db5/AQ7bnn2f6hrutdHUdnYT/HXEEnQCo+KrAE7h8Wa0nlXCe
         js2A==
X-Gm-Message-State: AC+VfDx8rvXxeZb2eWt344HbOoLyOC4y50MgYrdomq3lJE7YLQLMGhOc
	9C/7tq1jfvEpNsXkE39mM/dU/AJ2DHsq3HvC9Qc=
X-Google-Smtp-Source: ACHHUZ5oNdhIUx2xB+jrfGhYT0FuIwJvRz0qJgLFyQiNXnxfnPWdjEVDLqP31HPIQEbVWIBSBzGPYQ==
X-Received: by 2002:a05:622a:3c9:b0:3f9:bffb:d477 with SMTP id k9-20020a05622a03c900b003f9bffbd477mr5588467qtx.68.1686425675245;
        Sat, 10 Jun 2023 12:34:35 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id f2-20020ac87f02000000b003e4d9c91106sm2136477qtk.57.2023.06.10.12.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 12:34:34 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v2 1/2] trusted-firmware-a: update to the latest TF-A LTS
Date: Sat, 10 Jun 2023 15:34:16 -0400
Message-Id: <168642565761.2178267.17300504606939071102.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609171428.3319420-1-jon.mason@arm.com>
References: <20230609171428.3319420-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 10 Jun 2023 19:34:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4756

On Fri, 9 Jun 2023 12:14:27 -0500, Jon Mason wrote:
> Update TF-A and fiptool (which is part of tf-a) to the latest stable version.
> Also, use the tf-a tests lts branch (which is still at version 2.8.0).

Applied, thanks!

[1/2] trusted-firmware-a: update to the latest TF-A LTS
      commit: ba93470738f15238ffa47b495719e02a567aae7d
[2/2] arm-bsp/tc1: update to use the latest tf-a
      commit: 088c6825f55be50f880344d3fe7228af7de8164a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

