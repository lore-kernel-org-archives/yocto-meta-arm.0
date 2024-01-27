Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC686C46CD2
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 15:35:13 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.17857.1706369710916520706
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 27 Jan 2024 07:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=M4F+zuE2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-783b5aeaa63so133775485a.0
        for <meta-arm@lists.yoctoproject.org>; Sat, 27 Jan 2024 07:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1706369709; x=1706974509; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sz9YPbMRsUIih4rmuYYvOpmgS8gn+XBaKh/Z58Z1sPc=;
        b=M4F+zuE2Cxyx4rjy4VDEGMllzP6+Di4CiciTJsohr+rBbioBBL1HtXkhiS2UiHa6Pf
         8+otFSFOtJqgWrBzVERfzVHzYLCM6yK1evjnx7xrXEiI0S5AncrHeeEqiN1hkqp/EMxk
         f5uLF3ipmNews/ssXsV3JmE1X8yCCv4Z2n1/ewfOX877u2cT0torDOUOL5jkbPSdN6IV
         pPDQKM8ALH/f4wF9gH/QscP56qvJ55IkLNSVgVTBUuO3d1s/rK9kMHp6/SVJMaW/QJMF
         AairmQsGyAjSnOqZ2/McUpitgqRuV8Z7/AKGS4Lr5bnaoLL54qmfmTG17qW3dMohVkf5
         xjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706369709; x=1706974509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sz9YPbMRsUIih4rmuYYvOpmgS8gn+XBaKh/Z58Z1sPc=;
        b=Q73IFA9aMH3GnH/bKneUyHSoj4EhxmrWh7paOpUZ2o/w9ud1Uq6NllMua4TMmFSU8z
         +DG1wUCfLnnjegPFYMnBnzgl+sF5BOYaR66U3fEWKbtZLXz4j56s8MSZnj4RJzAjo8Kj
         6+YBBOeCRjgRbFUu4cz4JU2yI6E8O45bYhlYdz5vzKetBdw5d5YGXc1/9XnvpjDCgnIi
         bgmhF+SR0Nk2CgzAjGjYnkCrdc61PIQ6qpuzI8tnYFqs13er+JrV37Vu4f3XTCSw15vG
         U3czjGerG5HY2D5udJgpy6Go57+TFqe7T6ss5LiYmkFEg2NPTVwkANHoZsQXt9zCEe8W
         WiVA==
X-Gm-Message-State: AOJu0YzxJgEl7RJjpnyS/hYl+2xsAJV1De1emAe6Y+rPiPmQ9C1JFl1K
	pRZlsq34QJsEw8bXKQeKHFtUPkX/xnyyWB/OrDmnmOYVbssyL72gdm1nXTL0q9bPHduAmRD92p8
	=
X-Google-Smtp-Source: AGHT+IGNISKsi0LoZ7yxtIvRGQdQCzZ9gcf85POaJH3UTtXRudt7eW2LZ/6mwD6Rz2RSQY5VFxy6uQ==
X-Received: by 2002:a05:620a:27c5:b0:783:a2ab:4ec8 with SMTP id i5-20020a05620a27c500b00783a2ab4ec8mr1894328qkp.89.1706369709191;
        Sat, 27 Jan 2024 07:35:09 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id az18-20020a05620a171200b00783f0a95053sm236246qkb.73.2024.01.27.07.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 07:35:08 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	harsimransingh.tungal@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] n1sdp:arm arm-bsp: fix tftf tests for n1sdp
Date: Sat, 27 Jan 2024 10:34:15 -0500
Message-Id: <170636965745.2587336.13597229448024252249.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240126095922.2836205-1-harsimransingh.tungal@arm.com>
References: <20240126095922.2836205-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 27 Jan 2024 15:35:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5368


On Fri, 26 Jan 2024 09:59:21 +0000, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> This changeset fix the tftf tests issue on n1sdp. Before this change,
> the tftf tests were getting stuck on n1sdp. The following changes have been done:
> 
> 1. There were some tftf tests based on multicore which involve powering up the other cores.
> These tests were creating issues and the same thing has already been mentioned in the
> tests-to-skip.txt file for n1sdp platform in tftf source. Those tests are skipped while
> executing tftf and patch has been created.
> 
> [...]

Applied, thanks!

[1/1] n1sdp:arm arm-bsp: fix tftf tests for n1sdp
      commit: c5e288d1bba41fc957413bc5a028fe22231cf381

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

