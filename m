Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90783C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 13:52:37 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.22478.1705672347455971117
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Jan 2024 05:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=s8E8hF6F;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-429f53f0b0bso4792521cf.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 19 Jan 2024 05:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1705672346; x=1706277146; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47NEEw5KLjlVBJWjEqyN0cN5NQ6q+VJeK4laKlY1De4=;
        b=s8E8hF6F32KExicZ1IQCJxT49moL7gpL2un9SP+Q3nv37UYOXZIQ4yQetrwaTwSzkH
         0r3QocpGg31Hn2oppVig0lfaXn0iMqv3xnQmW52NHAMGjIvveXtZzHGhCmMS005Fx5lk
         cssUEl9t2ZWo3YbZGWQJBhKE4bag36smaXH2WNyijmmH8zb8fJb4o9n+/5lZ78xzTN/j
         GzXOMo9MV0E6i3C5cZR4MfCQpFETp6bn5mbGd1vUVpKuMskoZbjTY4lPr16FUC990hfr
         YJAtsipJ6o7PK87RtcF2COaLk6L4LhQ6P0Jjq7yT51fh93G/3lmWjyImivi8RUJJFBr0
         0R+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705672346; x=1706277146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47NEEw5KLjlVBJWjEqyN0cN5NQ6q+VJeK4laKlY1De4=;
        b=EZH1CK1hVdA6Ik8uikN6nUKYHjCh/J+VxQZuXf6oKIGLBvT6iE4HCiKZRuSrH1I8s6
         caqFTGJ+jVop/Vz/HKnVj48a1QmkKbqAjEc6mfIzlxr4gllzFYrVcN4uxJeiEOhBM+8G
         DuXqupiwk9ZxcR5q1QZh4igqf6mliz7XTwiW0j6uWBmjzoo0xAOK50+NYuEwKS7IG6Qb
         hCrb2ALQ84vyzjimOK4EN6mDBYX576GnT/OVwYe3ApQFEhQ9V6ugmRVlscnperxiESUP
         KibxeNVNTRvMKAAxhLTQTQgBXi1NjZWota9gmJxqKsAHCGfUo8FMRxnqta6Xrfap6bBz
         21yQ==
X-Gm-Message-State: AOJu0YzNnORl0uBni+1Qv90W8gBrU2sqU1claE/wOHfYGm4SXV4NuQkC
	GjEEfiRbiedtSshCvLOV5iCtG+3mMChy0Cq0OHacSevQg865fdCpVadXlIinMQAPgwr3ROG5+SI
	=
X-Google-Smtp-Source: AGHT+IFlxnWZocBJfcrNROlDC5GeOfsb4KizY8whEY9V//1Q81ZxevkBhKf6nS9+5/m0JGRGCiFu4Q==
X-Received: by 2002:a05:622a:1991:b0:42a:2a38:1cd with SMTP id u17-20020a05622a199100b0042a2a3801cdmr460246qtc.99.1705672345988;
        Fri, 19 Jan 2024 05:52:25 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a144100b0078344e29771sm5818221qkl.57.2024.01.19.05.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:52:25 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/opencsd: update to 1.4.2
Date: Fri, 19 Jan 2024 08:51:34 -0500
Message-Id: <170567229732.3021912.3455850291819209816.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240118143110.13747-1-jon.mason@arm.com>
References: <20240118143110.13747-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Jan 2024 13:52:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5344


On Thu, 18 Jan 2024 09:31:10 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/1] arm/opencsd: update to 1.4.2
      commit: 4ada4852830c9acc0cc4b71ecbe2f4b649caf469

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

