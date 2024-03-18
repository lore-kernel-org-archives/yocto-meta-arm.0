Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44981C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:30:36 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.52917.1710786626772835147
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 11:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=pe9akcQF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-69625f89aa2so4773416d6.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710786625; x=1711391425; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JEaWSBU61uMOivR6EtkGZY2ioJe89AYIYAhJuva50Y=;
        b=pe9akcQF5B7NJWX3712vq3o7l6I6VTmmjH8Q3mPjupNiVaHiIOA0jGVNQ4SypgSFDO
         j0piaI5s/w3dseeOlml0Py3GZI58vFSwf5/aeYLBZ2+p5Jh4MCYbyvEiotuu1jnmJX37
         2nGP6SLoF+aCpcETbmrsXlZEH3LD72pX8VrcYGgJJb5XGwFreS7Ms/ko/xhK+W+hhAVz
         oDaouQZNdOnF5aTlU57LGNw9B4AtO/kpAh4dODhQdAaNYHyv2r4cjbVoqDv5iKHzw5A+
         ZzuefJCQRyhuGN/QMbkQbxJw0gGU9G6ewD9oZCDqxJ28kGIiRBBwt6NRzY1OM2kMgkAK
         5Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710786625; x=1711391425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JEaWSBU61uMOivR6EtkGZY2ioJe89AYIYAhJuva50Y=;
        b=fQPBwyHOpCo1HAZ0Z75D/nlgyPYfLHIXA4+AuyKYvDI/Th8IOcmAWPRU2NiJZwww/y
         lMGF1HqAZiOWpP7Q72J4WoK2v1w9sLNsNf+avCuHbhdr0uiE7X3JYtckiNc1IyIudcXB
         rM1Y/ij/we6kKRS3wnLw7ETVJb8zE+/AFqJ04yvTEFJS1bJ751KfqgvVsfA2CPbXbIKA
         ldV+B6Ia63K2zKb5SNq2c0xryxMbKpi/yQXtlAUL5jij5RfDw9HmzUg0GYgBDGN1y7mt
         6RK5Wjp3CEkJfYNsiUKHNjO+0qyb74rDRZXEdCGn8wERkFl/lS4kHeUz8wSlqiaELdl0
         eLKQ==
X-Gm-Message-State: AOJu0YwASF4foDC4IRFJgPD8q8MQkO2njjJL2GzySjxYIwBzVrG+rqRO
	UpwfBfrDl1ALay2/hodIyEejzfCk+RPfzZpOv57YqArsKnAIN9wr5LTfLZt2Eq++oo1VnKBJEqg
	=
X-Google-Smtp-Source: AGHT+IHLeMZnB1iG0hI7ZYA+LcFDJMGQufYSV/2jOY+ECcFK66gO+XJYXxCr6fCMEjy3yv+tKcmIhA==
X-Received: by 2002:a05:6214:507:b0:690:eba2:6761 with SMTP id px7-20020a056214050700b00690eba26761mr294853qvb.20.1710786625714;
        Mon, 18 Mar 2024 11:30:25 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id gf8-20020a056214250800b00690f8192656sm5530175qvb.112.2024.03.18.11.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:30:25 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	anusmita.duttamazumder@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: Update scp-firmware version
Date: Mon, 18 Mar 2024 14:25:33 -0400
Message-Id: <171078633836.3024366.8976068260254795107.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318112550.7284-1-anusmita.duttamazumder@arm.com>
References: <20240318112550.7284-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 18:30:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5451


On Mon, 18 Mar 2024 11:25:49 +0000, anusmita.duttamazumder@arm.com wrote:
> From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
> 
> Remove scp-firmware sha for intermediate version
> to update to v2.13 according to the Arm Reference solutions
> Feb-2024 manifest.
> 
> Anusmita Dutta Mazumder (1):
>   arm-bsp/n1sdp: Update scp-firmware version
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/n1sdp: Update scp-firmware version
      commit: 1c35b69b6e005dce3ce50d34312ecf9eb9060a55

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

