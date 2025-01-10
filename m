Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DABE7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 22:22:52 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.3848.1736547765273012677
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 14:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ZcpUI8Sn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d88cb85987so21481276d6.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2025 14:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1736547764; x=1737152564; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9Fs842BzYkLem/epyEMP7RYmCjQozD8V6aRezqG7Zg=;
        b=ZcpUI8Sne0xltqFTF741K9QZ4ZeukCTOif+y3rx2G8o2J2RC3TSNFM7fOa8MlOP3IY
         BdIXSWx22i06UmELRt3hxQbxrYhVABi2FndKlP0CRtcpUOwReZsOmavasWQO/aNRENSj
         tpa/eUFESQpwaficIDFYoC5SIxgX3VKfDIOqeB9QLl0eYgU9SGzn1usxE4m7/iGvnQFw
         z4a02qirCcU5YpZL+gXJBgCRItYlXI9Y/1ztJz3Dv+EKVvqX39+zfEARaJ/4NpR+QB+M
         DIMNrPQKlmruM4FuG5BmPigNhjfcA6qZvjqHhxWJ4XueHyGADSHJ/6TtxCBBsGTLuaeL
         QjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736547764; x=1737152564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9Fs842BzYkLem/epyEMP7RYmCjQozD8V6aRezqG7Zg=;
        b=ScbdOMUlbLUqp9n+yNmFp7RJ4cwXEB6sO9FtDmuUkq52MRwmfYzsjuhqjHsCQWDW6I
         XbOgAsRz1jdsrb9sI9EGpZoDXNjQEVS1fvOYu8ZymNr/XqV4ZHeY7rMrLG6btqS0QSOS
         ct1XOQgC2NhaYjOMLzWnPzGX70CXB4rC4S5Ka4UQFC/kVoDpPjigrcf50Si10srYgxJo
         floMbc8J/7PN6+zjGfWfyKEPVtNTMHjqCe1lbbfyYt8fBn++6hzMUMGnpGrGlZRZNwYI
         T016hcgBCr7sGeVjYXLPmFQKV1GlhQmIZF9Mjgudn+PQE0LmwhAjQuwUwcIXHUwJgOHP
         soig==
X-Gm-Message-State: AOJu0YwFj8QhE34/u86HilJ//U/K1ylIF/J4UG+knIuU4vsKcwud31lB
	FwjS3MhCm++zMfeE0Pi72vqxQbDGfohe2XAvtyv9BiNusb5lPmX15l8FK6pnlmFVuWV9nptJzy4
	=
X-Gm-Gg: ASbGncshmiYaH2WGvAN3OscPHo4dmanaLo71S41AUCRfqdvpmBoMWmDuRftOz9UL1ve
	y8pNtpB/16HZWwBkhxrgUKfxKXhbQopIKUPOnLYnA0bMU3k3FP/PRCrQYhpowQaRysvUKnfgLMB
	RlLtbtv2oVx6r+bKPpLpzKBJnQvFbPo922ICe5yySezUyON230kRz5w8rATdF4qVZj7dC8BmYYd
	Fv94KDejAy9FUEV3KhOg7OXAV3+MbmEGJ8y72+lbEpl3aVT
X-Google-Smtp-Source: AGHT+IHLKvHE5gAIoAdMao8kEVg+qfntNdCKV5/YVupkUZbwoD6qHpQq9uO8gq/okJdu9Kw15HW9FQ==
X-Received: by 2002:a0c:e01b:0:b0:6d8:a5a1:b153 with SMTP id 6a1803df08f44-6dfba9dd36amr180736d6.3.1736547764060;
        Fri, 10 Jan 2025 14:22:44 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade73245sm13645306d6.76.2025.01.10.14.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 14:22:43 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ali.oezaslan@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/linux-yocto: corstone1000: Update to version 6.12
Date: Fri, 10 Jan 2025 17:22:14 -0500
Message-Id: <173654773643.57277.14353626751316683150.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107133454.29502-1-ali.oezaslan@arm.com>
References: <20250107133454.29502-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2025 22:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6316


On Tue, 07 Jan 2025 13:34:53 +0000, ali.oezaslan@arm.com wrote:
> From: Ali Can Ozaslan <ali.oezaslan@arm.com>
> 
> Set Linux kernel preferred version for Corstone-1000 to 6.12
> 
> Ali Can Ozaslan (1):
>   arm-bsp/linux-yocto: corstone1000: Update to version 6.12
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/linux-yocto: corstone1000: Update to version 6.12
      commit: bc5967ad8747874006a199365702df9b25f13ced

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

