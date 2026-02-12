Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3868EDF02C
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 04:03:11 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37384.1770868982122797637
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 20:03:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=MfB0BaEd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89577f866d6so21682636d6.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 20:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1770868981; x=1771473781; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LsDyjeYQ8hMyk++inxQtJG3GmwAh8eH0jNpJXbQRZ0=;
        b=MfB0BaEdVpdfp/VAETjQ4RTyIFvNyTyNgycVD30bY95S0rk66HqWdmU8JW6AJk6R0p
         9VIgoZbUGiXzPW65Z4se8eWY5rFcNH4EFZGqSrPzwgBILdaiMpqx3qGyPh5B0Roi9JRa
         EvPHScpFdlb9W+DazVhkYxQgQDct3MxaWleyabRceAOQlQ4UscRDwLsVXZ13oh0lK4de
         Iav51bP+nwB3XVqZD1i4aNd0FXNwz20RFmq/E4tRtRqk1z7bKLocJD8Wm5EJgT9WH5Zh
         ucm15+4aD+ddSDAGXSCHAOH0JA+c3/AeGfCuKPTxwNmeI/hNAGC2bkJQSOzt5qav7W7q
         u0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770868981; x=1771473781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0LsDyjeYQ8hMyk++inxQtJG3GmwAh8eH0jNpJXbQRZ0=;
        b=R6HtYJ/hbkHvmKfwaf3nZZe7gEVtM6GNhW+uDi/fb45KTuVQFnFFs5PGbmMY8HUBsf
         r9lRYb4pD084dv8DxvYMzW3gV5Nyg3O84xZaO5eBVIYBtejYVsDlolYk5923p63oT8ai
         NmZctD/rMXieLpopKHv4WWmk5qBjCU6ChFMaG8t0PgLzOlTFi3sGi4uDkDq2fKpXjYfa
         cGtevP9mG38dXFKqSwr/g3IGyxTW3+fag6MXZT7jww4GkKQf8hTALmAOvkZyUNHF7t3n
         80KkCtOE175nkpph8alZyRv1Sk6ZUc8I2A000re4A+sNwIkwtjZlWoTlu8dwSbAjYz9+
         ogjg==
X-Gm-Message-State: AOJu0YxirmhBXbvBTHdilNUN7y0/gkwLTzLRYH2yXybfjuAk09SKdWK+
	79/O+a8rvA3ROXBYCd0az96R5bUnZ7PoSfIGm2UbZFMCPoFSprxE0r7vVOIC7ayIYIru36EmvcM
	vKmk=
X-Gm-Gg: AZuq6aJXw75pOxpgMWsZFa0Qs5Ih1IlnXui44oX695Sp7DmLIkHp13MThtUjHHvP2v9
	uKNbkBm0pe0gS59sPIeI4IzYU4LFBMQ6qEXnEZKiAZFa+poBw1uI1MDkL1xVq5q+qdOE8JzIgEJ
	i56P33WI/QuQR5rSCZ1bQOx5bBUGfHkrm6oHhrJEY21nGvT6at0hof4xJTQg4sON4vlJFJflkaR
	lKll8Nmab6rlqqYOaxg1tCjdLuOFkx8TooTo1aeJ0G3aEDlz8RjKNpas7LNzWdXN94syP1f536O
	TRw35NhhOoh3i3D1WHySL28yFzspfvrmwWaCFtKJH2q2OnM1omUSBATA5phnoHdSmj5xydgLdhj
	yB/tTeuJRd0cfMjDzJVvrNiRX4jSuW5kApxH5ZELcU7N+NMRXLCgEvEGu4PzuJUKj+dBYkdwDV/
	BL+u944l3c3QRk
X-Received: by 2002:a05:6214:c46:b0:894:663f:6700 with SMTP id 6a1803df08f44-89728dcfb7dmr17763646d6.22.1770868980998;
        Wed, 11 Feb 2026 20:03:00 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0be6besm260579885a.5.2026.02.11.20.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 20:03:00 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp/external-system: remove redundant DEBUG_PREFIX_MAP fiddling
Date: Wed, 11 Feb 2026 23:02:31 -0500
Message-Id: <177086895275.770080.13449342474651445457.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260206144402.1583348-1-ross.burton@arm.com>
References: <20260206144402.1583348-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Feb 2026 04:03:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6908


On Fri, 06 Feb 2026 14:44:02 +0000, Ross Burton wrote:
> We have a newer gcc-arm-none-eabi now, so this can be removed.
> 
> 

Applied, thanks!

[1/1] arm-bsp/external-system: remove redundant DEBUG_PREFIX_MAP fiddling
      commit: 320301be3d88b6c9a2f7ae474d9f140c173b76d7

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

