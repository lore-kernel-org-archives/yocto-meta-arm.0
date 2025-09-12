Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9ECCAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 12:51:55 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.15987.1757681515282073294
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 05:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=JPfXrJQp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-76ce24d1dcaso2945186d6.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 05:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1757681514; x=1758286314; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvCpsPzdFc6UMVASbmrrP3nSEYv+/4noKnJO8tX7SfM=;
        b=JPfXrJQpfdb378UCLPoaot1BvQMzNxCVCOmFtcEDD9q2h1OKxrX8GoIHaYfFGUEiEI
         RHLJN+FOaLRlWXv8MG28inp/2W14s2XrBXnHvXJfNPm62N5wvGk//tolSnwvcdLW8cY7
         ViA81bXCtyV+NbmVs3v5kV+r9MKIkMZT41y99zURWa/yAww7s/9EXJnDSRv2ufrOn+D8
         NQ8M3Cn9SQ2vMIe73olCdNLMDYh3mEO6CYj3cMF+tUN2hl4mVMyLRZGagP9d4r2EKB+n
         nN7Y4D9LZ6bB6/7cY5Oggqg4jUAEZ/AQVoPOuXR7lQdv8mET7rba3t7yYD5AMLuG5zP9
         meig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757681514; x=1758286314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvCpsPzdFc6UMVASbmrrP3nSEYv+/4noKnJO8tX7SfM=;
        b=BehiqwnUTUvZncg5aueMme+/xP9J1mBXfIf4kYFAhaoWQvxKZI99OV9mxPpsoGzvjg
         t6j+V/0boD6d13uGbT6e2NfIjfJVkiEaTwZY1req22mJZA0JKdWNmPiKThf19H/+jOfE
         YXAuDk+6oD5mnomLVECIzBbTgyZNtylqdlozuXKpY0f9Rzd6lWQ+Ffmh4GDp5IMP3H22
         dRjcT+RMwqbJL4/0+4Up+H+AhIw9G0UDCVSnfkov04i4GhbqPgxjkDouT5KEjG85Huj/
         I2xi1QCihJ3yyrUlkgzWOLJS6Wo12Z2oatFLx60MrVaorpjVWD/u+WGt7N58KJU4NuQw
         vavw==
X-Gm-Message-State: AOJu0Yws4Wgmh1PXt4VlgQS1Wlc/b3ETVBGvas7JsDcsOkfxyodvtBMa
	3ycnVWKuljyg0j6uC9Q9F0VggHYcGALfUF9q1uXrdbgU90Tjug2BAdWztALNIvnewh4aOPZ4m77
	Vd9o=
X-Gm-Gg: ASbGncsEWfBDuuKQ1bnYjsU4z46cte13wk4egWlb7xroy1917qMp2dnF6pLgmcydYQN
	3xNkRMYF2v/c/uvj6o0q7qgKJ6Q0z7W6n9HijHqNapY9n89VsQpp3JQiSlwDmpLHFUtRED77MNw
	s6R0H7RZacbsF1JADDFZJ5qSWrZKkclS1QFRXGAJo0r+StlWufe3OyzLk8gWTTiI/cxH/GIhuTX
	vXrxrHqv/YCSPPLGMNPUxeAN3Bpui9n4y7lbeXtBCvCdk4zfZR0cPZA1RlkKlBVbm+qsBgK4Pcj
	0OQAl9FOjkWmdjfhZkf1y4QB7tEk5yJs2bnPrkMJtHBtGViG8EA/qpZ2AzGGvim9VsWopPnleiW
	HSKyeGENS8wUx8/nZqgMdi5Ym
X-Google-Smtp-Source: AGHT+IEve6r9MN4GTh3mD8+2DqL3kVSwAjskr7nT55Iv79KBNJxW4q7US0Ws791gzNx53o9u1aI7Lg==
X-Received: by 2002:ad4:5d64:0:b0:712:9051:c001 with SMTP id 6a1803df08f44-767bb87f33emr35132786d6.12.1757681514132;
        Fri, 12 Sep 2025 05:51:54 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763bdd373b8sm26532536d6.37.2025.09.12.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 05:51:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/3] CI: no need to configure coresight explicitly
Date: Fri, 12 Sep 2025 08:49:26 -0400
Message-Id: <175768136749.537781.16953530606104688298.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250910090346.1623394-1-ross.burton@arm.com>
References: <20250910090346.1623394-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 12:51:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6704


On Wed, 10 Sep 2025 10:03:44 +0100, Ross Burton wrote:
> The oe-core perf recipe will now enable coresight support automatically
> if the coresight MACHINE_FEATURE is set[1], so we can remove the manual
> configuration in our CI and let the machines enable it where appropriate.
> 
> [1] oe-core c455bd03910 ("perf: enable coresight if enabled in MACHINE_FEATURES")
> 
> 
> [...]

Applied, thanks!

[1/3] CI: no need to configure coresight explicitly
      commit: 56f84d176cefa314006e5a535826ad96386103f0
[2/3] arm-bsp/corstone1000: add coresight MACHINE_FEATURE
      commit: 177ccfdcd35d9ce3867a415fecbc64adda3ccc17
[3/3] arm-bsp/juno: add coresight MACHINE_FEATURE
      commit: b6997921b43ff8eb69e4d9b0a7fd1a8a26060cdc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

