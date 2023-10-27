Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C779C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 04:10:13 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.98.1698379807389895424
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 21:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=hu0VjRlJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-41cd4cc515fso12739841cf.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 21:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698379805; x=1698984605; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASI3RNHqkp6Dktrb8KifAPfHctM/wIBcghJUK1Jj0ro=;
        b=hu0VjRlJP0dtZJgNDOdHNZj9iRRIAgJ6rcwXO79nfOXizbjxk9gdNZ4MsodqPc4U7I
         U6cXUAu8FOk6Y9OFJjolI4Aopnc2RN5XzZpXFzOVa/uXV52TikeSwtECU8qo36xWqVlU
         PAVPPZUx5k5P90GSZWnDkdife1gmylE8axyRaAezTMlISCMZAA/KjmVrO3KHv6uzUVCd
         aaJWUYCk3s2YepV59qa1UxF5L6/5bh20JGb62ssubiJgkf4O1M97qIHV1oOrx1OUBZJv
         7uqMjuBReIYThiOfo+tjXfoUjLmBnchoSVGWa+LFuopDK2uo7iaMGgHpYEPnN22FtEs3
         o1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698379805; x=1698984605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASI3RNHqkp6Dktrb8KifAPfHctM/wIBcghJUK1Jj0ro=;
        b=mF7l0+sRq+IGf1xPkjR/SPeBlWqk7SuFe8Log8XGF2fshq1+WbJTUNDG4SV/K8JGfB
         x5jdKq4GHUioJnCwKh3k8V2glFsHcmY3j5+E7dkjm9jw/w+NEgg//Hkjmw7BO4aKrkj7
         8gtlJuhZDBK86N0tOoJx5+eoa3TP5KX4pbWpGu/CgIUadZhYgPTMnRgsGvMYkRT7nFhJ
         vIb5HwE18u+sS2ulGCbDVXUBcJu+O+ydk4mmecEO9uK1qy+QRMKJZNHzCC/r/qhJNZWL
         qLqQh1WtCasgeNqf2OQusSviO2vb+vZBMeRmDdKx4Zp3NqiQ2iWncgkUA8N22aFQqTht
         pcow==
X-Gm-Message-State: AOJu0YwbuPl8oewKtrxg155g8uQN3dLB7XWRKfzo9187JX1PnHKUe0Ck
	6/6LhKOWW/k58AzNxnO13ahB2GwyNZnOB9YtN7E=
X-Google-Smtp-Source: AGHT+IHd0f7YIBgsgwLy5aZ3LGrraz18/vhl07VkRDnIQ+/hPOvaVr29UoIUgCA+fb7ZR6mez1j5Sw==
X-Received: by 2002:a05:6214:1249:b0:66f:ae2b:7a with SMTP id r9-20020a056214124900b0066fae2b007amr1929888qvv.10.1698379805456;
        Thu, 26 Oct 2023 21:10:05 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id mk16-20020a056214581000b0064c1b27bf2dsm303716qvb.140.2023.10.26.21.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 21:10:05 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/optee: remove 3.18 recipes and patches
Date: Fri, 27 Oct 2023 00:09:23 -0400
Message-Id: <169837976565.3801272.5169582486305901417.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231025224448.3921419-1-jon.mason@arm.com>
References: <20231025224448.3921419-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Oct 2023 04:10:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5186


On Wed, 25 Oct 2023 17:44:47 -0500, Jon Mason wrote:
> 3.18 recipes and patches are no longer in use and can be removed
> 
> 

Applied, thanks!

[1/2] arm-bsp/optee: remove 3.18 recipes and patches
      commit: 2e76052ed2412baa750ca038c0f5045a0f94e73c
[2/2] arm-bsp/edk2: remove 202211
      commit: f62536177018ecfc97bbe5f2bb186120908db2e5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

