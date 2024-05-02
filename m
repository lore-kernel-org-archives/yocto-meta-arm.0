Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DB2C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:13:46 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.6437.1714659218904945226
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 May 2024 07:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=YcCWQis4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78f0440656eso504304385a.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714659218; x=1715264018; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgaUNbykDkeqH6s+PAUs9BfDesbeNVv+vj//S+5DhTg=;
        b=YcCWQis4ihJBVBL0LUamg/+Kn9WxqduFzvPo2D3j+hy+lozhvQ8EUn9MmIV3CMj6KU
         XeRg5wUuKF7eWuoy771NXFoFyOMSmOfgAyq9O2RwSOobYzu+mSgRRj5Ih01VR25kxG2e
         L/0Ia9sUJaabZt0ryaMO3ECLkVWB9LxUlkI9Acg5+6koM4OqVNudf8/1q4XzwhDEKR5o
         1qQbd6G3aq6ewITLBq9ErNcS3hKuWY4HQuoefg7INo3O1Aw0SjlkWl7yjJ7x6yJVqRhy
         0lwliChrhiAIN/Zmpb5CpyqnqgvAdws/mU+x5hejhSfzfOo8uAWTO7pt1tMZH4rjXRCI
         eYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714659218; x=1715264018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgaUNbykDkeqH6s+PAUs9BfDesbeNVv+vj//S+5DhTg=;
        b=Byebpg9jRXk5NKwmDcaY6KjljhMqepOP4lfxaskLkjl9QA8G/TzM3pqTeW3rTg1FcO
         0enCJkfjJ88FosIU9sELXEpQaXNOr9g6glOz5oEMbcWpiHUSSxKEznYotxswqL/uZB7K
         00RJ76CdfE8sPfsVjSTYeLci257fHV7WwxuViK4z+opsCOi0bfHyFoTYv28PaHc+8Jjv
         ACkeOivqkGDr/eAVzPpdmJlHzOZDDd+K3w6Kn+wttNxK3Av7qM0j4jprXhywXln1BiwD
         CzyEYZq9eZfuMU1Hdy8vvV/RI+VJP2zKjFx8N0FVtZVCc4PbR9DwMLxbEkJ6w05okrpg
         xZPg==
X-Gm-Message-State: AOJu0Yxb8rO/mqA8DZ6X+UOC09c6LlV0bGB/dnwehXokY6ozLIKx2F8m
	hWKDI3xJzkZ1IV7IpYiDhXzTn5qoe6H3vf+01qL/Qgwv4OyZ3mdpc+gvFryLsNg4cl9bxhbLpDE
	=
X-Google-Smtp-Source: AGHT+IFCJJT7grLh/NGV3r0aoLRvSdsVypVlYhQeA2U8lpC5i7BRnNqGsSjxLt0cJ7QFBTmUC0/dpg==
X-Received: by 2002:a05:6214:21ee:b0:691:8b3a:5acb with SMTP id p14-20020a05621421ee00b006918b3a5acbmr6898007qvj.13.1714659217534;
        Thu, 02 May 2024 07:13:37 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id db7-20020a056214170700b006a0e7b332aesm382451qvb.36.2024.05.02.07.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 07:13:37 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/4] arm/edk2-basetools: add UPSTREAM_CHECK logic
Date: Thu,  2 May 2024 10:13:14 -0400
Message-Id: <171465919487.3706898.3653447485779590123.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240501123154.62576-1-jon.mason@arm.com>
References: <20240501123154.62576-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 14:13:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5687


On Wed, 01 May 2024 08:31:51 -0400, Jon Mason wrote:
> Currently, 'devtool check-upgrade-status' returns UNKNOWN_BROKEN.  Add
> regex to return the correct value.
> 
> 

Applied, thanks!

[1/4] arm/edk2-basetools: add UPSTREAM_CHECK logic
      commit: 54b5c5d1dae177ee18c77d70e4d18fd964a436fd
[2/4] arm/boot-wrapper-aarch64: add to fvp-base CI
      commit: 950e191d7b2183c308efdfb10a2c42705776bb6f
[3/4] arm/fvp-corstone1000: tweak the versioning
      commit: f9025699f7d1cbbe8125ce57831448e75b8c1b90
[4/4] arm/fvp-base-a-aem: disable version checking
      commit: 7889ce020647d4d6a871a377b540c417fcb5d225

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

