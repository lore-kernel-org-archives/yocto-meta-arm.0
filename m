Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2256AC19F4F
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 15:39:18 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.87.1715182751082471206
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 May 2024 08:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=CrG1tnYc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-792b8d30075so37785285a.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 May 2024 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1715182750; x=1715787550; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNLjJZbTF1DkV1T4aARAt38Ob7LZcfEqFQ9NmHqpJvc=;
        b=CrG1tnYcf1j380c82Z78iBmWI9Z6bGU7aDbp3DlfwUzKtno4WJsNhoGvBS9wYfCZPK
         FYhJ+ShHDAv1HRSyzKuKtVtfOMGV3c+I6fuDf5KIXwVlmL/+V97V1z3qPAR6w9T6Zuxo
         AoPNXs0SpcGm+hFGa44GPzPYvpWna5BFigh8BaVTFpLIWB6jYogE0TjJn01KesOrLr8J
         aHS7GovxtMHtr8CBmq8X0fiFumtijIjG2TmgqcQkZajV48BOtMcIySCK8AjzATddmEN+
         kd0T8H7Dzi0hN9gscvwbowd3ldv+gPq2BqH5/+Md/Be2Vv+O/kxbBdZwM+tSQ31eycX9
         RdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715182750; x=1715787550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNLjJZbTF1DkV1T4aARAt38Ob7LZcfEqFQ9NmHqpJvc=;
        b=ibrL9fUDG0jH4inZrIefSgsErTbSYcOXL+Q3m3oLiXc+NsrZzSoAMPQI9DRFp5qqUj
         iQMdb/jD8s34fMj45Z9wlXpKxdfdkKJ7L0Zq592eIXe+TZkiiITddMyfv6nefBp8PGrD
         XpxXBdTRteTRJdJ+6Mjh39kt8v6UcRdeyP+bw1gdjLF1DvCifDgUCFCdUwfem5l1LsOO
         vNTUwXsXGnSZ96Ayg+32bQSxR5OnzaGEcUysYWGmZtEB6roPDeY/iwaOfF2zK1dg+jhI
         9+/6ME3Zi7kjizML1vfNosujpNflOupOKPdzDXGqPR71qDHQ5b7I/U9MkmcREgLJgHmn
         pa2Q==
X-Gm-Message-State: AOJu0YzwCuZM6OOmT4VLPxrpU5GB8ddg7jC7bjLzX+C70j4bkNcFBrxQ
	+ftou4n0sR6ePBsjzUjYblPEwLqBOpGkknRmRKNWmmrA1iC1/ksJ4P4sfim/S03ZOME1yaBEyps
	=
X-Google-Smtp-Source: AGHT+IEzacuGGhLzmSICwOIIK712TLGBu8wqDhIbJzFdd2W9p7cVAqrcB9lTyOpjHfoP9HiecMAKaA==
X-Received: by 2002:ac8:7d01:0:b0:43b:1561:6c45 with SMTP id d75a77b69052e-43dbfa8aff6mr30089201cf.11.1715182749854;
        Wed, 08 May 2024 08:39:09 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id fj15-20020a05622a550f00b00434946547d3sm7783345qtb.53.2024.05.08.08.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 08:39:09 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/trusted-firmware-a: add comment about location of deps
Date: Wed,  8 May 2024 11:38:47 -0400
Message-Id: <171518272945.1632928.10220435824638146018.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240503172524.61421-1-jon.mason@arm.com>
References: <20240503172524.61421-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 May 2024 15:39:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5708


On Fri, 03 May 2024 13:25:23 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/2] arm/trusted-firmware-a: add comment about location of deps
      commit: 1cd6c26bcf3e5d0dd8eb40cfbbf6d75077ff31dc
[2/2] README: add backporting process information
      commit: 4ddf285c5585c261ecfa64ed186b4a45e5032818

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

