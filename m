Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761F8CD484E
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 18:26:24 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.5034.1695407183121755433
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 11:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=c44ZTrIF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.44, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6c4bad60a1aso624342a34.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Sep 2023 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1695407182; x=1696011982; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CL1ip24WDqg0lWq+bzF2D/RddkCT7PITF+uoZVJNyg=;
        b=c44ZTrIFp+Ufhxw7COuVOl2+5XJ6CZIm2hrZxHntAXW+EyVyWavOt7a7OcI0311gTN
         zQlCcqgE3U4h2dqepNHE12SucYVKmxjwNJTi5F6FZbBDZ1PrrON+nXmovB6GqR3Xb9tM
         rbf+QVMVw2O8koGxuD3ydcQSNxLWjgKvM+m/bDhTIKkvrbT7WLVjBRgO6/qfqpmYG+xY
         Mza3e0y9YY/kXWRCwCiIMk5HN7JpdnWs7OuzjJGtBtb6yt3yWDmDXT5EWBK5alr/tO3t
         /rZUCQYcHfGwlio1LYSSHnJCWCi6zosekwrabR2EpBSdeX6LUcaZZXS26WZVD1hI89sm
         cHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695407182; x=1696011982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CL1ip24WDqg0lWq+bzF2D/RddkCT7PITF+uoZVJNyg=;
        b=J2R/h4pwsbDHn0KihphDxM0QSIEMN9cfgXotdsfUjArWhLkBege6CD8ZY09aPl6w1p
         y2se01991YLcjTcWbAGP81agFt/t4hZPrlsnsTjfzbqgnZ3fjGcKjv7lDz+jRjV0Yfq+
         obwE2jxNuq+tB+MP1wyNvtvy5zyrKaqOF4JS2ovat7OReO+aNcZhHvQJ3ItruqQfmHUK
         Nl2AyaCTBbk81qtVv351lIKAaoNea92UmSIG7qqJXgoZ0I5Vku692P8lXF+yaJeYx80v
         IDqm7S9TOu+QSlBIvyob7BTsyWkqjXT7EmCKUwDdPVVxS5Zcl40YMAeatAP2D1lMT5bH
         wtzA==
X-Gm-Message-State: AOJu0YyOxCY2LDYogwJP7Naur8q3+4qzVJJw+5ukAXtS6goxLhitMkzB
	y9sliOTNZWjSa77nK0OJik+r044k+wZKfPwU5b8=
X-Google-Smtp-Source: AGHT+IEpqnFskplXkqeBwXNuKUGZQT/XJNiZVuCxAAjVr+I04u6PBUKD+PXE0ERJSYhxtYJeWpYhYQ==
X-Received: by 2002:a9d:4b12:0:b0:6b9:c41f:ede9 with SMTP id q18-20020a9d4b12000000b006b9c41fede9mr550942otf.16.1695407181935;
        Fri, 22 Sep 2023 11:26:21 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id h2-20020a0cb4c2000000b0065160a2c8f0sm1641399qvf.138.2023.09.22.11.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 11:26:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/trusted-firmware-m: update to 1.8.1
Date: Fri, 22 Sep 2023 14:20:02 -0400
Message-Id: <169540680444.309200.7006294610374829816.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230919124435.3776850-1-jon.mason@arm.com>
References: <20230919124435.3776850-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Sep 2023 18:26:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5069


On Tue, 19 Sep 2023 07:44:33 -0500, Jon Mason wrote:
> TFM updated to 1.8.1.  Note, TF-Mv1.8.1 tags point to the same SHA as
> the TF-Mv1.8.0 tag for tf-m-tests and tf-m-extras.
> 
> 

Applied, thanks!

[1/3] arm/trusted-firmware-m: update to 1.8.1
      commit: e8844f4c08fe8abb6316ac003a93c97f8c79b79c
[2/3] arm/opencsd: update to v1.4.1
      commit: 7e26d706cfd29a96962930bc0f9685043339381c
[3/3] arm/scp-firmware: update to v2.13.0
      commit: 6333e1e19808872a646ed6194b32bfcc3d0287ec

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

