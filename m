Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FB5C04FFE
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 03:22:31 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.6697.1714447342108237011
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 20:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=L50QEQPV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-43a975fcdb5so12907181cf.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 20:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714447341; x=1715052141; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFFMZajnHwynj8zgeN/j69unQKtslUNJ5RvQx3cT2uQ=;
        b=L50QEQPV0j/Co53AvnTsnxuQ7tQ6lpxMZLpAYmGRYPjbZqy9Aq53fy5KesAJPGITsO
         59outJjTm7UmSDaJbD8DQO/WVOc4DzPSw19lH0xEndfSEaOB6SVbimNfL3EblOLzV9Lz
         BG1sPDlSE7Yr4kG2jk/Yvk4Etis03QRI/xxuvfAjgFa9OuYNMreTLJmY+3JM1tfq6m02
         wiMrqvxRpaxvAM2gB8zVudaNno7z169m36RYMPEQgoaCcPqLQoF9iSQsSSA7VR3mlDy1
         9zjypXS0wPijJt1u0DA2jjXWSpK2CQ0YD9PUB+rMy1iL9hN1zLxrOUwMFRPXm1PVG1GG
         UoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714447341; x=1715052141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFFMZajnHwynj8zgeN/j69unQKtslUNJ5RvQx3cT2uQ=;
        b=nv3rgM4qPbc9dNLP1tvSy4aCvBn7tThz/l3T9V7gnyEpgJAcP+TAzn5bTbzGpUKlxa
         F+u3ITJwuVhde9qVknjDVEBsGI6wHjZRFNtcrQWaXoK8uzWlrx3AHtAFODprxYyYfev2
         W28PncB1kiTNUBlgHdyQQ8IHN9stMgOTi+RnWJrUJ3Ou4CPAt5pr0ZZKu6N4GhRptyIA
         Nk2GpYkzvUKkMlM/NSR7a3uLBHbI6g3OtMGPTTTvBomtLU8GAhqxRfVwACvtmrb7JTZ7
         QzCqjfVq9naGTH6i74D1V8RdtegWxStyvJs2dlOJ9MHhBikK/mfe643IrHU3x8Jn2P/y
         W2zA==
X-Gm-Message-State: AOJu0Yz3dt7La68FUgVgLTYthxY3jA9OvP5OpIrHGozhxX/Gkf6mqFzD
	PIjeHpV/WgMOQAGSR6NXWWvk7kHggvttQMphCx+Mjb4EOdHDV7lOF82x2qaKH+zjVC2cLlzsetY
	=
X-Google-Smtp-Source: AGHT+IHDPp+KzQB94kyFpmx4MQof1nXdB9aT5GhxYEo7URNMyQx9WRDuwvFEe72M4OwEv+e9F9H2zA==
X-Received: by 2002:a05:622a:3cd:b0:439:daae:d6a6 with SMTP id k13-20020a05622a03cd00b00439daaed6a6mr1538348qtx.15.1714447340975;
        Mon, 29 Apr 2024 20:22:20 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id a5-20020ac81085000000b00434a165d45asm11002511qtj.38.2024.04.29.20.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 20:22:20 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] CI: show the evaluated KASFILES
Date: Mon, 29 Apr 2024 23:21:07 -0400
Message-Id: <171444726761.3765152.14490594955972485324.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240426134542.3085023-1-ross.burton@arm.com>
References: <20240426134542.3085023-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 03:22:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5636


On Fri, 26 Apr 2024 13:45:42 +0000, Ross Burton wrote:
> When trying to replicate a build locally, having the exact list of Kas
> files that was used is very useful.
> 
> 

Applied, thanks!

[1/1] CI: show the evaluated KASFILES
      commit: 0bc288f0f2082ed36a5c8dba422be2bfbc8dbaf2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

