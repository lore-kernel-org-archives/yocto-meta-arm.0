Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57292C27C44
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 12:41:46 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.7331.1717072901747385607
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 May 2024 05:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=samaOLTV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.180, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-df4e7763603so713929276.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 May 2024 05:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1717072901; x=1717677701; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHb8qznAGToBYjRU0dsT1mCOvylLIxKtV1Mg4t8dCcM=;
        b=samaOLTVpKB1VE0TNl8ejIz7TIx1OQobRHUSKLYrf/FtrexMLOwFXkLezU/MahWsp8
         c8aSZy2Er6LyjmZd5YmzyTNb/TBjUBlwWJWdWsxqzducSR76uBoIJK/Dtw1HO/Kdzqxm
         hfjl3uMcHgoDkpCbj+Zzrot4KFRmN64yg1sTQHe8tEy9SsGL/r5CUaj/mACY5jC68eYc
         RBG7MaIgRtIUS9s5yn9KuSY52ArVGtafef6Ipiz2SanXZ59nJSt1Fl9D5q5EM0rDWALd
         rGOjXBGObrcltI9JLdJV2NS/vOLaH5mYxpXhIPhcQfxUJ2VLFyCNN0LFB6SxGX6xNqa7
         oEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717072901; x=1717677701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHb8qznAGToBYjRU0dsT1mCOvylLIxKtV1Mg4t8dCcM=;
        b=qq4/VLMF5pszuqBgwLOhL6zDSbuu4ZWbufq8ad1/ih5J0/5mA2fj+MYA2i1mYdgaiI
         qiCn7GOjjfL+GeXiuEDfmbeUhf++0ztahwj0D6zjHA1dcBsZnnhp3aibtC9JLNlTIGsg
         BP9IIhINY5iiktXztW9LLH/sH6E1uwnDEa36W5wSKNhfN2r6xUNEJAi4gp4urtSDuCJx
         R1F2a+DEMQAESCG1piCULYI1RqsLVnLgeM8zJ9BD7HCIAacBF6zfpP1xCdvanS6+m0EN
         0iOu+vknaRaG8l7FcA4/BMd6xDqy9h8xd4Kbq2JXNSAnEUpYSsyjM5crNDg1kuOsXz7S
         /etA==
X-Gm-Message-State: AOJu0Yw48dHeMEpowuIWuKUbFQUHLPnv4MjmmzZ2lgfz4ouVsvYgadJd
	sGT8jtS9z+WK/RSB49FxnRlSqe5yObAVKta5P6dk5WPgCs8s/cyVbxoykSUj4oyVYG+PV7s8lis
	=
X-Google-Smtp-Source: AGHT+IFWgf4m35n6vxnAeJHPCurqUdxVzN+sv9d9xWyAKwnytnhr+ZqnzXKQBG91cXFDxObLttF/uw==
X-Received: by 2002:a25:ab50:0:b0:df7:950c:badb with SMTP id 3f1490d57ef6-dfa5a594f9fmr2172714276.1.1717072900736;
        Thu, 30 May 2024 05:41:40 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad9f112d96sm16916166d6.24.2024.05.30.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 05:41:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH scarthgap 0/1] Update corstone1000 kas files to track scarthgap
Date: Thu, 30 May 2024 08:41:25 -0400
Message-Id: <171707288448.1718187.13383740731187915594.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240523143722.118544-1-bence.balogh@arm.com>
References: <20240523143722.118544-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 May 2024 12:41:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5777


On Thu, 23 May 2024 16:37:21 +0200, bence.balogh@arm.com wrote:
> From: Bence Balogh <bence.balogh@arm.com>
> 
> The poky and openembedded scarthgap will be used for the corstone1000
> builds this way.
> 
> Bence Balogh (1):
>   kas: corstone1000: set branch to scarthgap
> 
> [...]

Applied, thanks!

[1/1] kas: corstone1000: set branch to scarthgap
      commit: b50f5fb37e728e7820dc603cfe7c22a6e5f050ba

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

