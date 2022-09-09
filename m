Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380F7ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 03:51:00 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.2637.1662695459564160412
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 20:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=uvznWviV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id h28so391425qka.0
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 20:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Gotv+8sSqRv+k22X6LOgcSInUzQdvun9NiCXZ5bAiBQ=;
        b=uvznWviV9QXTRsRnw7q4OFCKlxWqXauqT5/Yur7e/bV3WyyZyl5X5SwQVXYsd7UCnh
         nUyGcA2gPwrMnBIT3VHue7QIcmziuFd8rlFYRYWStCGHck4tmH8s2UegafZR8F9M4nxK
         ctzA6GdcIDjHTKxezNRJx+NqA2UEUwu802vwJs8g16m3Vc4hSF7dDa+v6hhTTflA13Fr
         lDnlS22KhsfWqk1IWzsARhIIQQD14x9/mcJs7A4AiGvy+qaoepCSX0fJR/Y2d0i+rez1
         7Vr+IvfnJLc7D0ZNDv0G7vdESIfcOaj8//7BER2T/v8CJ95ezVIgMh1KPjWkdBw0oj08
         MSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Gotv+8sSqRv+k22X6LOgcSInUzQdvun9NiCXZ5bAiBQ=;
        b=4jEflVQLpTwvgLOQmw4eCsbnBb17md6KyjgOmY26dfLTz1EJrG0bgaLnUOmVqT47b0
         hAhE2/Sfg3n1nTc9MPmqgKgWDOOHWKM91nzOQnhzE/89I5h89L6NkkuJRY3O3ZOirh9O
         RW4FDfyi4zoWXQtmo5zus8y/EgZmNWv6QSR/QtB5vux+UmTBwbWCcctkGw6quqMLm3AW
         5oQEg9tvt0ZjHF+j05hf6JaDpIgRX0KKxz9gmsPGxSEbzr9+dv76F0rhpH+dLP6e95r2
         LgsAEtX6XlFSTBuSxsQ/C0vioDdd0/NZp08dBN+CjKvtOjcAEiVqYhEZ+NVC6ILjnQBf
         h5dQ==
X-Gm-Message-State: ACgBeo3lFdSgKIP07mkxphfPuXU7nrYhmTbMrdOxNK2LLDziC42vqGKi
	w4QZRg+sRBWt3SXfyuF89+oz3E9TK6VjFA==
X-Google-Smtp-Source: 
 AA6agR5raP+R+I7K3ZBFV4qVWmQaQTvbRkNh3HIFb4V8z7Oi1WqC1q9PGdHOgh5Y9zFStA4ZJqGO7w==
X-Received: by 2002:a37:ad15:0:b0:6be:7319:1e81 with SMTP id
 f21-20020a37ad15000000b006be73191e81mr8973855qkm.81.1662695458049;
        Thu, 08 Sep 2022 20:50:58 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 ay17-20020a05620a179100b006cbc6e1478csm494387qkb.57.2022.09.08.20.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 20:50:57 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/optee-os: add 3.10 recipe for corstone1000
Date: Thu,  8 Sep 2022 23:50:43 -0400
Message-Id: <166269544401.916403.13943188152096103783.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220908192959.21816-1-jon.mason@arm.com>
References: <20220908192959.21816-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Sep 2022 03:51:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3749

On Thu, 8 Sep 2022 15:29:57 -0400, Jon Mason wrote:
> A optee-os v3.10 recipe is necessary for corstone100, as it is actually
> using 3.10 SHA and then trying to apply patches for 3.14 (which is
> causing fuzz errors).  Create this and use it to avoid these issues.

Applied, thanks!

[1/3] arm-bsp/optee-os: add 3.10 recipe for corstone1000
      commit: 9418819358942a8f2aeb8806b37c4d1de6ae0b34
[2/3] arm-bsp/optee: rename corstone1000 files
      commit: 503bfcdc363c96541e7a4452b2db20a71e8d5393
[3/3] arm/optee-spdevkit: add version to file name
      commit: 9ce6539660841de7d3b25e00876ff1ba30e0f7e7

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

