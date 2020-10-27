Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.13989.1603805657624055670
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 06:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ObPwCrgo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id s14so1089815qkg.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 27 Oct 2020 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zlSMihTqY+UXTqDg51b5Rd2Fd2zG7c9z2wCNMJejsR8=;
        b=ObPwCrgo1ropBRg107YNOkiImG5X4qpNDb7kbVMz8nvlL6XvMv06F3h7oK8uZGyIDg
         4jmVO3LfzgvnVscOgtxYV7uMr3GDrdCWT2W2xLSXOO2pXy+pr5ckcUtdwSaMy5FdfKQY
         1KLMkKzbq7uP+ETJiQrB+cCsgRDvki/EoEYIcHvhbXGfSkC8R1I9ge+XpE5rIxoArdpl
         n2AM1eAvBvJIZbapmWhVHG87AcD/GxRP8iowogxw25OFhY3myQ5WemddowgE6AI0zNiW
         vpK9FuVzegrIcMAO7k9E2lfP4tsuiF9FF3C2lfLsSzRuXeARtP7V5L7d26EQYCMOzkjm
         I7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zlSMihTqY+UXTqDg51b5Rd2Fd2zG7c9z2wCNMJejsR8=;
        b=AoyLHufGaqcLhJokl+XT4gNH/Hhp2CR3HKMdwdhlW8UVKlNse9ZFyg5l/M3aEuSxKT
         JlGqLZ8C6Qo0ZRXulhF2ePS2wmBecMDSnLuiO6MajFacIyWGcVWtAPRFLxZ5P4CRIFoE
         CIj/pKjgNjXWiSSL2KuYlxlwLwtCubJKlX4FnfsA2/rEQ8LOO7VauqaHfLP7AL1yE3kv
         wZ5MmoVoh/Lm1hI0mL5AvZv4SlIbTgPuG5sU0EnHXcLFm2hQiLF4JpQoA0vPr2C/Ll8I
         +984UvlwEtNm4u3TiH0u8J49LFV8f+86v7erWaxkFzlOLpGSPtHl0QxRrEVArhqrb9Ik
         7fGg==
X-Gm-Message-State: AOAM5304UtYkk7pLm+eltaQAx6pIOGGNJ0E7N00jwZhiZZF1+T5bHZQ3
	Gwx8LzlX18Pqlh3T1DDlqNqZ2w==
X-Google-Smtp-Source: ABdhPJx1SXDStcL1LIATwizYFL1LjIvJGMP7jP4MdVXfe0vy31USA924PBnSAru3n5CfBIRlFN1+3w==
X-Received: by 2002:a37:a4cf:: with SMTP id n198mr2051398qke.271.1603805656757;
        Tue, 27 Oct 2020 06:34:16 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id a3sm765344qtp.63.2020.10.27.06.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 06:34:16 -0700 (PDT)
Date: Tue, 27 Oct 2020 09:33:56 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ricardo Salveti <ricardo@foundries.io>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] Upstream state of the U-Boot patches
Message-ID: <20201027133355.GA549@kudzu.us>
References: <CAAaKDhG7X77t=Z1C5sTGZkycOvNj=VNE5swKXQmgsmrg_bJrYA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAaKDhG7X77t=Z1C5sTGZkycOvNj=VNE5swKXQmgsmrg_bJrYA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2020 at 08:56:55PM -0300, Ricardo Salveti wrote:
> Hi,
> 
> I'm using meta-arm-bsp for providing BSP support for corstone700
> (mps3/fvp) and a5ds, and noticed that quite a few u-boot specific
> patches are still pending to be sent upstream.
> 
> This was already the case with the previous ARM bsp layer (before
> meta-arm), so I wonder if there is any push for landing those in
> u-boot itself, instead of maintaining as part of the bsp layer.
> 
> Looking at the u-boot mailing list, most were not yet submitted. Do we
> know if the direction here is to keep them as part of this layer or if
> there is anyone actively working on upstreaming those at ARM?
> 
> This is mostly to guide me on the best way to maintain compatibility
> with those as I move to newer u-boot releases.

meta-arm's long term goal is to have everything upstreamable to be
upstream (u-boot, kernel, tf-a, etc).  Unfortunately, this was not
feasabile in the gatesgarth timeframe.  So, we made "Upstream-Status"
a requirement for all patches in this layer.  This way we can track
the status and it helps encourage the BSP machine owners to upstream
things.  In the hardknott release, we will be pushing harder for all
things to be upstreamed.  

To answer your question, there should be people who are working on
meta-arm upstreaming those patches, and it should be happening
soon(ish).  Please feel free to hold us accountable to this, as it is
something that is very important.

Thanks,
Jon


> 
> Thanks!
> -- 
> Ricardo Salveti

> 
> 
> 

