Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95541C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 13:51:35 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.13750.1747403492082161229
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 May 2025 06:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=JYYuhxa6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4768f90bf36so23358251cf.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 16 May 2025 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1747403491; x=1748008291; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tQ14sIZ/EDwWyjXEW6rvdA5c+7O/1c7y3kfmWr8YpsU=;
        b=JYYuhxa6dv83GvQAwHgyLuwpQNxaUjZzA+y/B1LILqbBELyxedG4SOQqJXecgQJjca
         +eBedI0IhP+/JUhleu2nJh3ZQDYvZ1cdb40iXFCTGgO9DvZqpNHhUjGhX4861Kr3F7hK
         qdk2g/dtZcNSBlJvAkxrAhcpUmdMyWQYF+/v2ZxP9OQxxonv46kQN8Mqa4VDIUOB5qv/
         lTGxiiBCEyR3yI8IgsvXmEv9merUMOnDwfGsblxq5iCsU59OKxYfVQqr8D2VY+KDsDUJ
         ka9rnme0gyCr6BjEiZYu6n3gA1YgoYYXYPn04rwxL08JgLWjB26bC/5yN8qdwEfvlxp1
         mbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747403491; x=1748008291;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQ14sIZ/EDwWyjXEW6rvdA5c+7O/1c7y3kfmWr8YpsU=;
        b=Mz8BYcPvU1cjCA00ChTnRJL9XsTYV6ys9GAISTKWzCqwHRbG41xn6+ISumhh1G2eDX
         lKKE5uKpCPAgKh4nguSA28AVMMoHLiGci/BJs/n1s0CnGQHOrdwtHJuZVV0BRjfrXPMd
         JduM/QrNOYvZaJW+YHsiV5njy1y5BH3JLluUN9cofpoqyxAYHHQgg9I1MrJ0cX0kqNu/
         CmBK0TDZnzkPS4B6lgkjMc+QGyrvFx1KkQDGDs31kPmaiNH42hrdeSZSLZPSMnXE4yyt
         Ib6dOFhQRJ2YNteiyQ7dl//xJrYCU6lFRBRTrOX9ZM2X1ydx0mmOa4xrcDLo777ZgU+j
         ylEQ==
X-Gm-Message-State: AOJu0YxTxgdQR1ubQqqEh+W4NocmNFczZbN35TVXEyOHut4yI+NYvuV+
	EKYORDJ+j4fSGjCQ+6muXPCRHj32CxyUXeGK/J/sW0m0diqpUz0YtTj5JO+R+WWGBzozjOSCfuB
	6YXwX2KEycZ74nLNuOqj4NiMf+AGPFK/fJ18sHP+aPdOz1/d2TJ5eTJ3B
X-Gm-Gg: ASbGnctQ8ZKDG/Ry2V77BIhCZk5iWEaR3WF2oUUAqq9AY1RQbx7FmH9wUhBHpU7olJL
	jiuDUsDNYH4bBDtrtkV+/OSeuKuwgd3GqcP2Fv/rJIbE5uowtlKXqzxtVmPoqpNsOxc5RSD0iiu
	7wJyF9QjFs3wMh/zTqOQNHfKrnK3mLKbeR
X-Google-Smtp-Source: AGHT+IFYUjJxcW1Uk8t7K7JxXwzgQBeKWgMCVXQL+teaD45lg+YVzBzGCen/XduyjQ4n9dvxXmG3IQRPfwtNujhxUh8=
X-Received: by 2002:a05:6808:1a28:b0:403:3192:383 with SMTP id
 5614622812f47-404da7be5c2mr1508567b6e.35.1747403480567; Fri, 16 May 2025
 06:51:20 -0700 (PDT)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 16 May 2025 09:51:09 -0400
X-Gm-Features: AX0GCFvgZEb1CDW1FEuLWJhZbyr2pMpbXn2gbnQo8lSFG8EdLg4Ia67I2-ecRCg
Message-ID: <CAPoiz9zRLkYuDZ3YPkxqat5Qz7q+dwEVwFPn-mJFNnHXwFz2Ag@mail.gmail.com>
Subject: meta-arm kirkstone update
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 May 2025 13:51:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6504

meta-arm has released an updated kirkstone support tag, 4.0.6.  The tag
contains 2 patches from between 21 Oct 2024 and 04 Apr 2025.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 4.0.6) with a yocto-x.y.z tag (i.e., yocto-4.0.6).

Thanks,
Jon

