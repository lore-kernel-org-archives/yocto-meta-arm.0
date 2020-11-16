Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.35626.1605537846624790803
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 06:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=FbZ8AkWl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id 199so16932011qkg.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 16 Nov 2020 06:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=O9NrovEiPUyaQWV1dVCIVX2kYUwBtlLlJrrpUZfgorY=;
        b=FbZ8AkWlqKYdH0WFE6Y6Yf4yZSwD43N+48yImE/THjzkH0V+6f1gyPzfIAKCaVzOvm
         MyNGIK5rE3VKLVGNzSQcO6XEb6s6bCuU0UeIFnMje146g1LLCQ0exHcgt17VIITzWKtF
         Hi/wPNXwHqJi9DsTfZvX6IJ2Rsuo8MWTcwcgWdB2vRpBCei83VNbVPOiDXLYlEYvh6YX
         JghwBiJIfqb5iP1uidPQCHWyEbvYKf9y9hPsK3b0Q8xkSqOwK/PUKUxESPu8NtgGiPG2
         ZLu/9Egt1yvM7Ah7aYexodB/sH54Dyuz5r8ahvp+NJ7QTFBze9Cy352dj1MirESQgew7
         s2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=O9NrovEiPUyaQWV1dVCIVX2kYUwBtlLlJrrpUZfgorY=;
        b=X2olq5qQxPUXB8A6XEeDZ3frBKku3HEgNmdZ3d/G3IlHYYBF8PdujuohcWy2DjHC+1
         V0Mz1mcLniEkkR95ZtqXpFsyx+TorqqZETcNWwzexxIvllS22HEzTTkDUDT9ptA3WILO
         vfyeiIJGUR8bwcK8wGbeRw3L8LPGuXSQ5YkbsJfgHCd8S9enAt/S/PyFSC2D2Nj7iHJ3
         jQ7pPPiATCjBF1VA+aMz1c7vH6Qp7lTEIT3tovUR9VBrIhRIAI0qf6TqWG+oVPK5F25P
         qtqUpbVEWqVNkfk5gkuBB6tcZZlHM65//ejI+Mt9Iv2qSoSU4DWEKXhLn341iNMY94ji
         Bjbg==
X-Gm-Message-State: AOAM532aTJm5lIcVtb/+BszJug7MNtsg07yKPuBZRabYwdZTdQgkG/OB
	y3Vu5wAwdHgOl+heVoEokIx46J2KrREU8Q==
X-Google-Smtp-Source: ABdhPJyaTx+3S30yOQTiIt46czalhlQjAynafX/EpF9/edMY8NRGB9MZONaPDx5A/XBoKVsNPZCSmw==
X-Received: by 2002:a37:8c05:: with SMTP id o5mr15022939qkd.396.1605537845601;
        Mon, 16 Nov 2020 06:44:05 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8d8f:f072:1037:de6f])
        by smtp.gmail.com with ESMTPSA id q20sm12568451qke.0.2020.11.16.06.44.04
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:44:04 -0800 (PST)
Date: Mon, 16 Nov 2020 09:44:03 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm gatesgarth release
Message-ID: <20201116144402.GH20627@kudzu.us>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

meta-arm has released the gatesgarth support branch.  The branch was
forked on Wednesday from the master branch and was tagged as "3.2".  The
tag is GPG signed and my public key can be provided if someone wants to
use it to verify.  Per the previous public discussion on this list,
gatesgarth will only be taking bug fixes and be passively maintained
(with dunfell being the actively supported LTS).

Also, we have tagged and signed the dunfell branch with "3.1" for the
initial release in May and "3.1.1" at the current latest.  We will be
creating new tags as patches are applied to these branches.

Thanks,
Jon
