Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87732C001B0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 01:35:13 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.79021.1691544908255877508
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 18:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=EwXQX6G0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-76ca4f88215so385496785a.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 08 Aug 2023 18:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1691544907; x=1692149707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGgcOqxd7CUkQzorvoaYwReI4OkGSbvvcYEJ7qWgf10=;
        b=EwXQX6G005KEIDsyuZLzBAI1um2Qj/9J/lOr3vw/gynnxLlkosFwRllhelhpTzK0pk
         yaJ815RvxPQ0wsjlZ//rtEaMvIgYDzpvUWVSXWEsfXTVGVXdK+HXoeCCoelhI2OQkTIQ
         VR0Z2eq4EaIxX0TIJcP9lVhZfoK4Rol/1kRUv+qdL1zCi2bzKU7bluJsZx1fmOFi8cPV
         8DFC5x1zETUHlNcQSlecwF1d2V27Rpy1BQu2sjgb8XQGKzh2hbprxCE4vtjglf45m6ZN
         FTa4jadAxUXTvGA4WzZ5wjTOYY5iWCzWeuTyKfqwFRuVmGuK8HB6eN+hCj3YMC4ppwf2
         56Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691544907; x=1692149707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGgcOqxd7CUkQzorvoaYwReI4OkGSbvvcYEJ7qWgf10=;
        b=MlxbFsWzd2y1R3MD795rbDYqadxs4Ur764cgtwLODhgR8PP2QRS5E/UvUIrY8BJXVx
         UqrjjGLGsuEn6jPIRxm5aMji66/xV3cCq4VeWjgEQxIaUaoDLY4DUEQg+ofSr17PEREe
         xP4BkLBWybnvpTmTGofrztlqXppSnTZgtIJ9AicC79YdM5EWux7oetuz71wO5gC/2a2B
         PjYfDrCpWQ9i2Kf/IlnthRL9KFq6Ttl7dWM5Z9e5zrWFCQWLu9WRD1zH0OEBGHMax29x
         oL5s1Vp5Ctt/aOI2dPlLgtbeiWH4bmhxqKq5Tbpsnd2GErImFc9ljArrWV5Vtkn/EYn4
         Di0Q==
X-Gm-Message-State: AOJu0Ywfyf8bZV9xq+WnqPOG0vdZbrHSnhsKJCbnMk1Fd/wxahryrQ0v
	t1lPn245rc5yC5wX3LspZBJBCbDrBnxsuF2bjHk=
X-Google-Smtp-Source: AGHT+IHHKW8x4CQRomDXUJ/xEX7RKXthv/HxM5iypRIHtwz6i0HbQFwYgiSAFhbZSESv7z7IuM5XWg==
X-Received: by 2002:a0c:8e45:0:b0:63c:d763:7648 with SMTP id w5-20020a0c8e45000000b0063cd7637648mr1102280qvb.37.1691544906861;
        Tue, 08 Aug 2023 18:35:06 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id l3-20020a0ce503000000b00635fcd30ff9sm4090543qvm.40.2023.08.08.18.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:35:06 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Robbie Cao <robbie.cao@arm.com>
Cc: diego.sueiro@arm.com,
	peter.hoyes@arm.com
Subject: Re: [PATCH] arm/recipes-kernel: Add preempt-rt support for generic-arm64
Date: Tue,  8 Aug 2023 21:33:44 -0400
Message-Id: <169154482387.1960847.7552224697497738905.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808035752.1894696-1-robbie.cao@arm.com>
References: <20230808035752.1894696-1-robbie.cao@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Aug 2023 01:35:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4949


On Tue, 08 Aug 2023 11:57:52 +0800, Robbie Cao wrote:
> Add kernel configuration necessary to build an image with preempt-rt
> support for generic-arm64.
> 
> And tweak kernel configuration for preempt-rt kernel.
> 
> 

Applied, thanks!

[1/1] arm/recipes-kernel: Add preempt-rt support for generic-arm64
      commit: 992c07f7c030caf0c52665cfbd2a30899bba7015

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

