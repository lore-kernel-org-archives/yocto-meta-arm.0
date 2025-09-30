Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC7DCAC5BE
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 15:03:21 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.27736.1759244595049752559
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 08:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=y4XSEDFa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-856328df6e1so589092485a.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Sep 2025 08:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1759244594; x=1759849394; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbbBjzah37FZPawYt67arKMzPxM1/bZxGILZeTGlbxM=;
        b=y4XSEDFa8NbMvgwhl6g7frqjoHvla3nok89zJ0cGR9hG3LYNiutJSgQaKOp1vpfWY9
         fv/H8WCa6DZPgSCxFk+dtCdgdwhnI3S8SGz4WLtkjTgHsfM1y8XSDDAFn9/v64f4WCeU
         tNcUOfgQnOIIc+eCZfZbgABfJv0xhRi0ItBtq9Caa1fpmkIiDTdAJLNkSJNuPTCeIEF6
         Uf6kZfTvV52cuazf3pVDEdfk+VKFgQ9jNQUKySfxqSBtj3j2+7dVYIrn9B2JNQqL82WP
         5TAIB5ghJyjtOKQeeUjlkhSKlm7FCAi9+KGhvlN6JtAMXyDoNsBc4ehUTRbmmupujcEI
         RSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759244594; x=1759849394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbbBjzah37FZPawYt67arKMzPxM1/bZxGILZeTGlbxM=;
        b=pSZnPbIz6/Q5CJnfr3QKdOQIbEjTSXMleqWsBSUvk19H9JXJ2h9n0a9fsJZLW4I3Yk
         wf3LPrzqyNmLrrDS2CzDM/tBXurybECmpM0ob2S3wfqvQOvOzlGAmFvvJ3V6onH++3OO
         ekSevAE4w4/KmrMtnsqY25IBVzqT7iISFOPaTRzKzW2eptlf3SS59Cia97D06uHUPKC2
         zBJvSkuSGP9pKIjxSgU0jjv4S+CGrixaGCPxjg5nck+wwEOoLe/zgo4YhWKyXYoLumt8
         wEtaxN529PI3hULxmwQwizegvSWkaOIvMfS6A7CWSr6CbRkyIJe2cG4Db1WRp2GvloFl
         RmQg==
X-Gm-Message-State: AOJu0YyIp1a66oYEO8Tg6g9fZlDWdEcwBdbj/JCKvBDinR7iOBsf4LCb
	0m8I2Wq1VHoMQsEhfjBwE3oLHB4hW8CRNCDgMec8NiLlnE/uUo/CME1bdD9hDU9CXvY7vaQOgMF
	xEUE=
X-Gm-Gg: ASbGnctZ2bTV0vFaEWC1oMYH+T3jEym6sWBV9wgR/xAyTLld6yUDw6cBQpXd/mStnvJ
	//e5ee6BvX8Wr6yK2KjLk0ZKzVmCH89UhtGIHJOPSS3LoSkpEu/mA3Og+OOwbTLfx3KTfNATllX
	D+9+4pJR0uBzSs+rkobwbwuQf4mTQZrmIiAzP7Z0xCcY66ac1aejJRwMBNIdFtwvfrKcn4aosva
	bfUn/zYSOboL+G55AGQf5ymlUrc3dPz9lK5cY9BDVoKyjH4dOgs8zr2NJIXlaA+89K/FihsWYNu
	NGL8AxI9TT0N576guiRgLwGFIEG9PZr0LBZ7q9/uSRQWJ9j1r4W7IQfh5OrQS2R0EZs/taIU/3N
	W77dg9A6BeMDNC+QaBsivSwjV7pARNQxkHwPANA==
X-Google-Smtp-Source: AGHT+IEuY6XXSJPabRi3gJUr+2R9DAKC/TY/kt7OBjP/gRK8Bf4P2wMA57jPMeKizTapsR2gx5B/OA==
X-Received: by 2002:a05:620a:319f:b0:85e:a145:ce25 with SMTP id af79cd13be357-873768a527dmr9042885a.64.1759244584285;
        Tue, 30 Sep 2025 08:03:04 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c2a1913d5sm1053717385a.31.2025.09.30.08.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 08:03:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm/optee: remove redundant libgcc flags
Date: Tue, 30 Sep 2025 11:02:57 -0400
Message-Id: <175924457697.3383641.77111686183168773.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929164552.2107331-1-ross.burton@arm.com>
References: <20250929164552.2107331-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Sep 2025 15:03:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6721


On Mon, 29 Sep 2025 17:45:51 +0100, Ross Burton wrote:
> Upstream appear to have resolved the libgcc linkage issues as these
> variables are not used in upstream nor our patches.
> 
> 

Applied, thanks!

[1/2] arm/optee: remove redundant libgcc flags
      commit: d85711c0498ed651a3be4a5e31e9a74814a6f288
[2/2] arm/optee: clean up OPTEE_COMPILER assignment
      commit: 1c86990f95174a698962e9423785ca059c2d00e3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

