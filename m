Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87F5F33A65
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:56:23 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44586.1772718974607340351
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 05:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=01uWz54m;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cbad8e6610so872059385a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 05 Mar 2026 05:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1772718973; x=1773323773; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MI3TUsruokyOUgJn79P0fxuQ+uOeJbwt/hxApq9lltk=;
        b=01uWz54mLfk75LKYEdi97EZpcK6/m4OEMurrMiEZMAJqoDPIAAQn3frbr4qGHCmoFW
         x1PBKMY4dOJHfGIbH6IQ5aa3b1ZHYgRCwobItwXx61Ma3C+tx943HGJ/20S57XATF6w9
         Djzi+o3Ufli3EfrNAZwoivxyF1LFlzhjc8Kvo4nOecw7Oy3umEXr4tseych0jkpCdeeb
         zSevPcwiild3Ve0wm0MpXUmTRnizPbbY2dwYRu0tQXqxQh0mhxzQr5renoYf1PAtHMDk
         D9CuckE8vMXfgRNwBOf2xbaFSHatTWKcmxkyi+GkaZjS9HoeXMSFF8Ze/G/5vMEa4M9v
         kYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772718973; x=1773323773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MI3TUsruokyOUgJn79P0fxuQ+uOeJbwt/hxApq9lltk=;
        b=cgcRAvX51wnw2Fk2WOFJbSml6apglphW2eLgqxWDb+hZD+aUb6uClC10FuvmZ+DtHE
         eCIwCZWB2P9CpdfSKf4qsojJTyJJ3YFcI+D/aT6paN+VcmfVgPwH0VVOtPAO+Xawz+qf
         /2MhIAumVLLSGQGFymVUsRhS8HjGyUhrLIAGDV0IRF+057ijthuba5l9WKq+2Knwpllp
         Pr8X6GWaONwrPViRKZVScV9Lx6A8UTfYBRCAgOQdZ32OWFFKx33dTHANjYqW6G/fbZvx
         ms0ANybDX37LGo7RSGGesaIZxVa3mgintZemWYxByinHse0xcd2vIry3Ki88Gd9F9bFo
         G7AA==
X-Gm-Message-State: AOJu0YyebkAX/l4sraAKzFNHQf0aNyNRw5JMetEWO3EfYGOL9AaXctRL
	nqyV49uH0JduWmqKbrGpW4vo/M9oi2Ko8WFi4KMG6+Z2lFCh9YDnfN6O5kkJY038rk9q3vu94If
	1II4=
X-Gm-Gg: ATEYQzxgdrXuCYNDJhyqBU7M7nlsKA+k+93GcYY+znTG5Ux1f17CVBTY1oIAG9AhMp6
	b/zOKS+sIqchIBAY4kA1jBBzxG/Gj4BmebqQWGimOpOocw1PZKoPpOwUctoV5YZ3ZeFV6y8xgx4
	8piA6A6nsXDWCYyXvny40es4TqNRpxN/V5Wo0wJ12R04PgAEd26fBGSFzV/ubZRkE+BFYAD958/
	nB5P2l2XEonUsrDlYs0Q7B9NOuJIHyFRxrIZ/X+D94FxNuV52whUnp962dJllTc6kQM3pNepHA1
	2GsqXPsX7zSG6mY8Mht2hVpgo0KWQHDpGF/IFlU1ROHeE3zczDndnFIf/uSLu7JPH/JTkCU2nq+
	OAmCBE5hXvvLj6TJSsbuTm20Cjd7SfF0qvuTaxxmuJA0fxgrHXBLYJtVA5v7M0ekp9hjkGMfOIA
	by8W0Hc0AaVxDc
X-Received: by 2002:a05:620a:318f:b0:8c7:1119:2994 with SMTP id af79cd13be357-8cd5afa9ecfmr703938885a.64.1772718973227;
        Thu, 05 Mar 2026 05:56:13 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a09ffa5e1sm64260946d6.21.2026.03.05.05.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:56:13 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/trusted-firmware-a: update LTSes
Date: Thu,  5 Mar 2026 08:55:53 -0500
Message-Id: <177271895366.2989959.1892122106133855668.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260302160634.41221-1-jon.mason@arm.com>
References: <20260302160634.41221-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Mar 2026 13:56:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6943


On Mon, 02 Mar 2026 11:06:33 -0500, Jon Mason wrote:
> Update the TF-A recipes to the latest stables/LTS versions.  Not all of
> the versions updated the version of mbedtls being used (and even the
> updates didn't update to the latest stable version of mbedtls).  We're
> using the mbedtls version specified in
> docs/getting_started/prerequisites.rst, not the latest available.
> 
> Also, update the related fiptools and tf-a-tests (which don't map to the
> same releases, but were all verified to be at the latest versions).
> No real change in cot-dt2c code, but updating the SHA to the latest.
> 
> [...]

Applied, thanks!

[1/2] arm/trusted-firmware-a: update LTSes
      commit: b5207f77a62f9116f4affbf41670cd4b42d6ebaa
[2/2] CI: add LTS versions for testing
      commit: dcc34c19febcadf17730cf64c87d3c13f540a3e3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

