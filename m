Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FCDC4167D
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 18:10:53 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.2845.1698775851795015033
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 11:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=xoUc46Zz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.174, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b2df2fb611so4151700b6e.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 31 Oct 2023 11:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698775850; x=1699380650; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xlh1BZRp6bc+fJpYuWmHGq4lHbqJEn9K5OaLmOCW0JA=;
        b=xoUc46Zzoe8a6tKqggTaVW5rBN00ddPU+xkGp2tX5l+NP5bshOcBuxUAvdsvVGrBpg
         iqmFIr2CBnMFvnkB3Jgzs//RwcQwq/Coe2iSUQdnxlZAgpEx4jFnF7hoWCAeKnWLHFOA
         Fy5AUpofKS7FAwTMZ0jWEbDJ18FbyEqEZlNRtElANeYx0NxOIwTOCN8IBB63RbtFQyiQ
         BKba86d07pKi+PxXjAXs+qFxjsXK0PPhwTo53E9/F/yt+fICRjgrhPuYr3jyabZwQFJY
         0ISH+otnqHgHEW4zyWYNcqbLr5hqLr41vvhHGJhOhvYupsgsh9Rsu9t3AYrFggEdk3bU
         fKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698775850; x=1699380650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xlh1BZRp6bc+fJpYuWmHGq4lHbqJEn9K5OaLmOCW0JA=;
        b=JGGDJTFJSIwILS6crdXAK/CA+DqbCWe2c9We5+/Qkgd+IMTspY6NSBZw+zAjB4Y0qO
         dUyzIBWdnU68zsvBHxEMUlPG3CL6VehOq7zN32Ej6/K8BEpNba1l1piH6GQ81Q2OPuUN
         E8Ayqco+oMmRUkhxnMIO3GJaw+Lw/avCplirzpHXThyLN3tQJlSopUXtr2KhtKd2cfKQ
         EIWqWlElxVzfu3D2oe71AORGIV55OtRayRhw5eftk4X0i1fJ9zm4vigv/G7HiurGpAf+
         E5kVx1QdjRM1i+/5s2q/JfYKdCvit16HzMrS+CZePHcbgTMvxqbN6FlKl6yioeOEtnkE
         F3qw==
X-Gm-Message-State: AOJu0Yzh9Cy8rz4RZ09pgHNzrB34HfChsGZh0MIaLnlegf9ipJwv8b4u
	nWC4A4oIpNhxqBGnzttIhz2h4B3A2f5oGY5ChOs=
X-Google-Smtp-Source: AGHT+IEohlUYSb3sv3cUzNQS+jJY42Pc1UjQKmtO74201sn8Tl04b6gt6V/Qw2wCeiXfk/fwjZrGGA==
X-Received: by 2002:a05:6808:b2c:b0:3b2:e44c:7745 with SMTP id t12-20020a0568080b2c00b003b2e44c7745mr14271328oij.57.1698775850668;
        Tue, 31 Oct 2023 11:10:50 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id n11-20020a05620a222b00b007743360b3fasm716670qkh.34.2023.10.31.11.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 11:10:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/optee: update to 4.0.0
Date: Tue, 31 Oct 2023 14:10:15 -0400
Message-Id: <169877581528.1610178.4124852548897452505.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231030142053.3961926-1-jon.mason@arm.com>
References: <20231030142053.3961926-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 31 Oct 2023 18:10:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5190


On Mon, 30 Oct 2023 09:20:53 -0500, Jon Mason wrote:
> Update the recipes and patches for OP-TEE 4.0.0.  Migrate the 3.22.0
> recipe to meta-arm-bsp for corstone1000 and n1sdp.
> 
> 

Applied, thanks!

[1/1] arm/optee: update to 4.0.0
      commit: cddaf8cb0c15cb935a120a3cb81feaafe6b1bb71

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

