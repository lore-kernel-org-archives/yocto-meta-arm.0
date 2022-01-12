Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC343C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 15:55:27 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.24944.1642002927381923471
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 07:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=M9tN5WJN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id p12so3352673qvj.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Q9OXwv+1a3PU+BLxEQZmntR7K/P2qEZcXlM1ClZEMLQ=;
        b=M9tN5WJNVb38H+on3Mj5hTXVmNNK+ygXV1vHVsvJMksAHNZ7JOX/3yXk7Mjt3oH7mR
         49XbgLewleqHJb7nid0r4XHm13xrbZ+9eoeXE2+/fZl/9/Qs05g4bVdEDDWdI9977s7t
         vq6dShidNYu/Q9GMkMbOghrxrMYgZLmS31qOe8uwhgHBXzzJgbL6Yzgu8AiKKWaBRR+w
         rDxdlNUVighOCySLX4Lbfhx16p45p5C/6IgdOx+cjgD/gRplLpucwXCqJWRpZ0Ovt39C
         i3VAIMVaMVLBnR7eqIwTERx8rXfZ3EDjLuoDtxbylorfVhyoUBzPIX6USCdS5//xnnh7
         ESwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q9OXwv+1a3PU+BLxEQZmntR7K/P2qEZcXlM1ClZEMLQ=;
        b=BnnEXU8gVVsFyVL6sNDHRBQ5Xz4+1TDZ45N8VTmBSJuB0Vg7PWzyUev2OgN8m6RcsR
         RkLFTOAq1kSWwK9r0lfj6JgSbbW+Wax5gBlyMqLQruoRIPzxI802R23pQKl3WiN9Se6i
         nEHpuxkgFhaK4pc5IKytmIVEouLmJapPuLUh39JwzSRnDj85DjWSF8X7F4+KRfpGAgMB
         fKZuBx916SmHI1A7gCdrfabT3Bk6Y3Hs9M1FUBAgguvXJWM5iBKewEb8ATR71M+13PwZ
         XVUGS3kWoonvsilLRXA+q4+gwMriWhK2601E9Ln9SIOwCCHcgtA2fb9RgcxHBl1fL3qf
         3ZDw==
X-Gm-Message-State: AOAM5317L8zF0FRQNH98g+k3gEn35/jUsJHmDYUF7UC4OWWDYK8R0mQh
	Aj4mozb8tOLGFY2RRChtIO8FXw5mjAlTHg==
X-Google-Smtp-Source: 
 ABdhPJyM2IsV9P2h9uQIIjeo3kfpGIgKfeOR8snGEwhY+7trZ/u356TkA/GvjiczZi0xftBHymRM7g==
X-Received: by 2002:a05:6214:2349:: with SMTP id
 hu9mr40141qvb.93.1642002926399;
        Wed, 12 Jan 2022 07:55:26 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:584a:a7c3:657e:d1c5])
        by smtp.gmail.com with ESMTPSA id
 m14sm58916qkp.112.2022.01.12.07.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 07:55:26 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/opencsd: upgrade to 1.2.0
Date: Wed, 12 Jan 2022 10:55:06 -0500
Message-Id: <164200290693.3080473.16212072606079979827.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220111183053.3220111-1-ross.burton@arm.com>
References: <20220111183053.3220111-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 12 Jan 2022 15:55:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2825

On Tue, 11 Jan 2022 18:30:53 +0000, Ross Burton wrote:
> 


Applied, thanks!

[1/1] arm/opencsd: upgrade to 1.2.0
      commit: a834653374cb3485fe8c6561f254ce701b5b281e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

