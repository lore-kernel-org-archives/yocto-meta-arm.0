Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28103C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 19:30:04 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.31764.1658172599622231967
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 12:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vG40Sh1R;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id c20so9505887qtw.8
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wS4kU0LjBqS0Lhl5GvGU4nZuWJF3WLshRhpqTHB4ddc=;
        b=vG40Sh1RQfS5S2BBp/jJAte+tywVYRNFMJQ85gTIkXN2aWXB+fz3ntJf8AckS+Kgtv
         962M/mA9rWngdc/dKkG/wF6xuRR0lEu1lGjVEs5q0lacaCvDNXNmjaVC3Hd56lH2BIhN
         zw3ylI6mvMoHkiX9i9S9MAXWBMiNuuG/38QdJIQfz7oNXNuNy4iNa7/7XwFiZVlAvwSW
         jsaxAAbUsYjWtgIElXi0od5mPaTSw3o+np/mE9wRABq+9RZ8TtYC8Q2hwugCBTQP7CiY
         CFeGpMri21WB6U9nDCpLBhIZq4y4855fJtSktY1v7MFsWcGnRUuyr/xd6nWnMYMmV7xG
         SxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wS4kU0LjBqS0Lhl5GvGU4nZuWJF3WLshRhpqTHB4ddc=;
        b=tdq9TYh/TrZ9sInXUilCxuTOzv2gRfcbivnyfWQZUc8Wt5h+Xrz9DO28sh2wPnhgTr
         KhOTv0prNRT7SKSupNcwhKnapWV7Mcg7T+eLCmR8tBZ3OpteL4iERoCnoa0EwgLS8eMu
         OdRp1CRxzolJNGBez3n0CGTils+AT/MOd8/gy8UkIRrAO6WUckEFvikUU512/WHpsJk9
         1QyO5nhttO75Vwf6jZy8URfptVhbEZgkHyXtE8Z9/3/noxnJrgNm1fYCrVKlcNamBn07
         fTDIZQMj4tZiMWZMk9B6Wkm5w6CW3wm9twQeZrjKyPbtFopXLEef2rIO+b+QVXoZogi4
         Fu/g==
X-Gm-Message-State: AJIora9OyFUvUmUt/GwvLNeuWokdh0eIsuSWIRWnhTR9ZoVpffWlsTMV
	Nf1cBh/QfixH+UdSw0wEnPywG7wKWunW/Q==
X-Google-Smtp-Source: 
 AGRyM1sdbPKi2q8fxPKb5rxKzUWfEtsPrHEL6SwtBPWE9ln65uqK6PNJUGZm5XuQxzYGzwjwfRbeDA==
X-Received: by 2002:a05:622a:304:b0:31e:eb37:cbeb with SMTP id
 q4-20020a05622a030400b0031eeb37cbebmr6574765qtw.140.1658172598256;
        Mon, 18 Jul 2022 12:29:58 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bk34-20020a05620a1a2200b006af1f0af045sm11678366qkb.107.2022.07.18.12.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 12:29:57 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com
Subject: Re: [PATCH] arm/lib: Improve FVPRunner shutdown logic
Date: Mon, 18 Jul 2022 15:05:54 -0400
Message-Id: <165817115467.414406.4742336592968866035.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718121533.3274181-1-peter.hoyes@arm.com>
References: <20220718121533.3274181-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Jul 2022 19:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3567

On Mon, 18 Jul 2022 13:15:33 +0100, Peter Hoyes wrote:
> Please can this be applied to master + kirkstone.
> 
> We have encountered intermittent hanging during FVP shutdown, so improve
> the termination logic by first issuing a terminate(), waiting a bit
> then, if necessary, issuing a kill().
> 
> Move returncode logic to after the telnet/pexpect cleanup so it
> actually runs.
> 
> [...]

Applied, thanks!

[1/1] arm/lib: Improve FVPRunner shutdown logic
      commit: 78fce73c3803aba82149a3a03fde1b708f5424fa

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

