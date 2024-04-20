Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D38C4345F
	for <webhook@archiver.kernel.org>; Sat, 20 Apr 2024 22:45:10 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.22144.1713653108728072276
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Apr 2024 15:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=uHqo/5Lx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-78efd533a00so206688985a.0
        for <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 15:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713653108; x=1714257908; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1KR4tN2Zeirb/tFVrTxJ8fBTO71h/N+bcNUoGqNz/A=;
        b=uHqo/5LxSTfFeBE/B2eLpu/Zdi+QRNz+6ijpUd1OiRvamvZXUf68Wmgd7V1v++0qJ4
         OnW9oOWP8cLkRh3T8NmLpKPcq8Vm3Vkk1tqDZ4nwdi2WUptlJI5o6sy1Jjn5SuM2KU3f
         K+JdOZHfQPpY3e2iyAYjSLL8OWAyH8wLh6lejRyseyZjRQMv/USu6yEE2Q7mzT4rvePA
         vCyuME3HR7rJxpjZWjnK/STD8mt5Lsz/7MkDrMNmHXpx8UXRHrRFY/H0vrxLcG8O8D6f
         fYq+Hk/OZ87czaHzU4ojHVvjtuhs8WDKzEyLmn1zhJfx7LtzGdNYolud2bSHhya4HXxf
         MP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713653108; x=1714257908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1KR4tN2Zeirb/tFVrTxJ8fBTO71h/N+bcNUoGqNz/A=;
        b=SqTvbHvpze2T58ToHvecqT6snrZC9/5uapc1C9/7Ep2ypsqhq0+136Xrh0DUOoyvVf
         Ql5Kj5aph/kg+PvqvnDZRoTLzTBzjZ0gWbpmeFSFw5xc7cqQTbt9L+v0PaNlz2/ZduP3
         5ORFUQMgdtGvJh42zrUAKwZCK3VRsf7pfm3NOeqqqJThj7WcZL4lZz3HbogURyeZQxZ6
         8h/wIahgKjZFZtWtRNq7AOJMfXVTelMfT2oq+FphN5wbKa8sfN0cLZrN5NlIcE2OrIxQ
         aAsSx5OWlUlziXADG4t1roRg+E+LHXr4wJ28B2pqrR2RQ9sQMXrsJTANleJJ6pw+x6Vs
         /mYQ==
X-Gm-Message-State: AOJu0Yx/b5x5+KCr7/gCwbznFerZ235znHMPOWza+/rqJLSP8HWdL4lM
	P5wamofgl1oLmLR/VZcTqNNP5FYeYPMYaE+3gk9Fa9n1eujctL1DDm+v8bt3Q6X8gCh8vjCNS5g
	=
X-Google-Smtp-Source: AGHT+IEq+ibTeF+/xsadImV0dA8BG6YqIHwqqoiPMC/CU+EAc+ZrxSnWExmBkILPeVBPYW9tSeAoJg==
X-Received: by 2002:a05:620a:c10:b0:78d:6992:baf6 with SMTP id l16-20020a05620a0c1000b0078d6992baf6mr5999796qki.73.1713653107733;
        Sat, 20 Apr 2024 15:45:07 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id bp6-20020a05620a458600b0078d63baf516sm2832473qkb.129.2024.04.20.15.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 15:45:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/linux: remove kmeta SRCREV SHA
Date: Sat, 20 Apr 2024 18:43:19 -0400
Message-Id: <171365299878.816258.527955249903526499.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240420132556.77421-1-jon.mason@arm.com>
References: <20240420132556.77421-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 22:45:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5573


On Sat, 20 Apr 2024 09:25:56 -0400, Jon Mason wrote:
> A SRCREV for arm-platforms-kmeta was added years ago to get
> yocto-check-layer working at the time, but was never removed (and never
> updated).  Removing now, since it is not necessary.
> 
> 

Applied, thanks!

[1/1] arm-bsp/linux: remove kmeta SRCREV SHA
      commit: 2a579f5f544fa356f5abf89c08e33ce7cfeedc6e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

