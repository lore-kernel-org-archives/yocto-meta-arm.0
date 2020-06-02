Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
 by mx.groups.io with SMTP id smtpd.web12.4721.1591078216523215699
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 23:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=t0zo6PeO;
 spf=pass (domain: linaro.org, ip: 209.85.219.193, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f193.google.com with SMTP id d12so96926ybr.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 01 Jun 2020 23:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zaXHRBrADztN67mnvtHkV50HkdcXVPFo2xMd0XIB4NM=;
        b=t0zo6PeOfud8oYPBBk2e/yvlbxjHaC6k1L7jT1gM7F/yNGAvlPD91THPDZKglvjJzW
         9nT148pnBYtUsLdEN3zXC648QU1MfUAwGUWWru/sjb7EsLmf6eG8owrE45JuBkDHwB5R
         Ak6UeMVHcu0mmy4PMeUMEaGFNJFQcvkaCTrDdVXG1KkxgdHGy/vxy9/uyuM/TyK78xa3
         W/aelvpJvWKV0Hw1yjfPiSdJ5xzSkJjinXMZNgpv2SQ32YC9j5dR6qIicvgisMgBwpOk
         w89G16DPAf42P3MMshApd3CyJZjKrykkm1VqtWsaEv78f4buZN3OR+t4wHqTREuxTplu
         BUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zaXHRBrADztN67mnvtHkV50HkdcXVPFo2xMd0XIB4NM=;
        b=ddbsPY7JwvY3I4xkC4ZThd43Ok4xxL7M794buLMZzFbnXlyiTFh3bfmyYtz8G6IJeU
         NrDg9v8JyXx+dnO9gg8dl1HDKjT0OwbVgLo3o42TpHCMSVStoFdxiUfwVuFtG/yqOOcd
         h1OK1DqRboqwX5wsBlERmoDzMU40q8UXl+f6W//34WjD53ytssIU+lXtmKe/2DdHtIle
         xiqDO2cfHBQ6alHipQT0N7ODD0SCos4ZUtginhJzO0JSnNryjBLGV+HS8FIJp6V30CHj
         Iouf1BxpGYLVOoGKHYzTW5SazfBkKhMR9sQkoTP1lfN1aBUSjm+UVw8xqj4/stdy/sQx
         1f7A==
X-Gm-Message-State: AOAM530PwNqtsEaJZmXHy8FWLTQEaqB/A/E3ODa1K1OQ1T3Qj9QulkrI
	m8egw7Hsn+WlMc8XIs8AaDPSAL7hHB9tobWo+8NJXw==
X-Google-Smtp-Source: ABdhPJwsovd+FRq5ODTevXyTxgy2aEuyEl+u6nNuvfnH8l3/lPvMM1MwDWLWo4qK2DS+hCfuIloP5AfWwr7SYpBrqDQ=
X-Received: by 2002:a25:b8b:: with SMTP id 133mr15551536ybl.373.1591078215505;
 Mon, 01 Jun 2020 23:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200529151427.20272-1-JPEWhacker@gmail.com> <90DD68A5-0834-4C82-8A06-BC3972756CA3@arm.com>
 <6d6ccf5c-f134-1a15-e5eb-8f5e10d03832@gmail.com> <09986319-6338-471F-A0C1-5096F5ED7AA3@arm.com>
 <CAJdd5Gag=0HF8+5KiF0DoLG1WZs+0ngbnT7G8CS1dFa=ydqjoQ@mail.gmail.com>
 <20200601213141.GA31505@kudzu.us> <a6576f43-1722-3f32-dbd0-3d4ad0dd346f@gmail.com>
 <20200601225610.GD31505@kudzu.us>
In-Reply-To: <20200601225610.GD31505@kudzu.us>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 2 Jun 2020 08:10:04 +0200
Message-ID: <CAP71WjxbYKYduu1hsTrFdwKRVKeEmfAK5_6aGjc-k44fhi540w@mail.gmail.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
To: Jon Mason <jdmason@kudzu.us>
Cc: Joshua Watt <jpewhacker@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d8ab6105a713c370"

--000000000000d8ab6105a713c370
Content-Type: text/plain; charset="UTF-8"

hey Jon,

On Tue, Jun 2, 2020 at 12:56 AM Jon Mason <jdmason@kudzu.us> wrote:

> On Mon, Jun 01, 2020 at 04:55:24PM -0500, Joshua Watt wrote:
> >
> > On 6/1/20 4:31 PM, Jon Mason wrote:
> > > On Sat, May 30, 2020 at 01:39:49PM -0500, Joshua Watt wrote:
> > > > On Fri, May 29, 2020, 10:37 AM Bertrand Marquis <
> Bertrand.Marquis@arm.com>
> > > > wrote:
> > > >
> > > > >
> > > > > > On 29 May 2020, at 16:32, Joshua Watt <JPEWhacker@gmail.com>
> wrote:
> > > > > >
> > > > > >
> > > > > > On 5/29/20 10:21 AM, Bertrand Marquis wrote:
> > > > > > > > On 29 May 2020, at 16:14, Joshua Watt via
> lists.yoctoproject.org
> > > > > <JPEWhacker=gmail.com@lists.yoctoproject.org> wrote:
> > > > > > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > > > > > ---
> > > > > > > > meta-arm/conf/layer.conf | 3 +--
> > > > > > > > 1 file changed, 1 insertion(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/meta-arm/conf/layer.conf
> b/meta-arm/conf/layer.conf
> > > > > > > > index d96e9f1..1c241d4 100644
> > > > > > > > --- a/meta-arm/conf/layer.conf
> > > > > > > > +++ b/meta-arm/conf/layer.conf
> > > > > > > > @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
> > > > > > > >
> > > > > > > > LAYERDEPENDS_meta-arm = " \
> > > > > > > >      core \
> > > > > > > > -    meta-python \
> > > > > > > > "
> > > > > > > > -LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> > > > > > > > +LAYERSERIES_COMPAT_meta-arm = "gatesgarth"
> > > > > > > Could you explain why you want to remove dunfell compatibility
> ?
> > > > > > dunfell doesn't have the required python recipes in oe-core, so
> it isn't
> > > > > compatible with it anymore.
> > > > >
> > > > > Nothing has been tested or is compatible with gatesgarth right now
> so this
> > > > > change will really have a breaking impact.
> > > > >
> > > > Right, you certainly wouldn't want to backport it to the dunfell
> branch;
> > > > this is just for master where the next release would be gatesgarth
> anyway.
> > > >
> > > > Also, with the qemu support I added, I think we have reasonable
> testing
> > > > coverage on meta-arm, and in particular enough to have high
> confidence in
> > > > this change.
> > > >
> > > > Finally, FWIW, upstream oe-core and meta-python have already made
> these
> > > > changes on their master branches, so it seems like we wouldn't want a
> > > > useless dependency on meta-python in meta-arm, *especially* if the
> idea is
> > > > to get other bsp layers to depend on meta-arm to consolidate things
> like
> > > > TF-A and optee.
> > > We currently have a requirement for dunfell compatability on the
> > > meta-arm master branch for Arm's BSP software releases (which will
> > > be YP based going forward).  To make a stable release for our
> > > customers, we need to draw a line between stablity of our dependent
> > > layers and the latest code in the meta-arm layer.  This especially
> > > relates to the BSPs Arm will be adding to meta-arm-bsp in this
> > > release.
> > >
> > > We do not have to keep dunfell support in master after the release of
> > > gatesgarth, but we will need it until then.  So, please stash this
> > > patch until October (which will be here sooner than you think).
> >
> > Hmm, that's really unfortunate. That makes me think this layer is not
> > actually intended to be a centralized location for ARM related things,
> and
> > I'm probably not going to try and consolidate things from other layers
> here
> > anymore. Not having a master branch that can be used with the master
> branch
> > of OE-core really eliminates the possibility for me to use a BSP layer
> like
> > e.g. meta-rockchip for upstream development and testing if that BSP layer
> > depends on meta-arm and meta-arm is perpetually stuck on the last
> release.
>
> I'm in no way saying that meta-arm master should not work with
> upstream master.  I'm saying that we want to keep compatability with
> the previous release so that we can cut stable releases for customers.
>

I have been very supportive about meta-arm as the central location for ARM
pieces, and still believe it's the right thing to do. But like Joshua, I
find this discussion a bit disappointing. A layer is a "social contract"
between the community behind this layer, and the rest of the OE/YP
community. Refusing proper and meaningful community patches in master
because it doesn't some 'internal' needs doesn't feel right.


> We have a requirement to release BSP SW based on YP.  Just like I
> would expect other vendors/people who want to use meta-arm.  So, there
> are a few ways we can approach this issue.
>
> 1.  Merge patches onto dunfell branch
> 2.  A development branch based on dunfell
> 3.  Use master meta-arm-bsp and dunfell branches for meta-arm and
> meta-arm-toolchain
> 4.  Keep master compatible with dunfell
>

I think the mistake we made (I am saying we, since I was involved in that
discussion) is to have a single tree that includes both the 'community'
content that the ARM ecosystem wants to depend on and the specific ARM
"products" that are needed by very few specific people (e.g. your BSP
product).

I think #3 is the most sensible choice, e.g. you need to split meta-arm
into 'community' pieces (I think that would correspond to meta-arm and
meta-arm-toolchain layers) and your product pieces. When we build your
product with OE, you would reply on the 'community' meta-arm, and if any
hack or custom integration is needed, then you can do that in your product
tree. You might even overlay things for some time there, it's fine for a
product layer. Of course you will need to worry about doing the 'proper'
fix into the community meta-arm at some point. But if you don't commit to
maintaining a layer for the ARM community, the risk is that everyone will
start forking meta-arm recipes, which is not what we want.


> One is simple, we actually do our development on the dunfell branch.
> However, this breaks it from being a stable branch.  So, this is a
> non-starter


> Two is still simple, we do all of our internal development on a second
> dunfell branch ("dunfell-dev") and make any releases we have off of
> that.  The problem with this is the integration and testing.  If there
> are multiple branches to test, can we expect developers to test every
> combination?  Also, there might be a need for different versions of
> the patches depending on how much master and dunfell-dev diverge.
>

That is an alternate variant of splitting the trees.. doing your 'product'
in a product branch, and keep the expected branches (dunfell, master, ...)
as community branches. It really depends if meta-arm-bsp is really expected
to be a community thing ever, or if it's your product only. In which case
it might be more appropriate to split it apart.


>
> Three is more complex.  Since only meta-arm-bsp needs releases, we can
> simply let that one float and fix the others on the stable branches.
> The problem with this is that we are currently needing to add recipes
> for things into meta-arm that others might need (like SCP, EDK2, etc).
> So, this will work once we have more stability in meta-arm, but right
> now we are adding too much stuff to make it viable for the next
> release.
>
> Four is simple, we keep compatability with dunfell and make the
> releases off of that.  The potential hazard with this is if something
> in YP master requires that compatability to be broken.


> I presonally would like #4, because it is simple.  However, if this
> will prevent others from using meta-arm, then let's have a discussion
> on it.  Perhaps I am not understanding something fundamental.
>

But the whole discussion started because you said you needed to keep master
compatible with dunfell. Even though as you said, it might fail eventually.


> Thanks,
> Jon
>
> >
> >
> > >
> > > Thanks,
> > > Jon
> > >
> > >
> > > >
> > > > > Bertrand
> > > > >
> > > > > >
> > > > > > > Bertrand
> > > > > > >
> > > > > > > > --
> > > > > > > > 2.17.1
> > > > > > > >
> > > > > > > >
> > > > >
> > > >
> 
>

--000000000000d8ab6105a713c370
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">hey Jon,</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 2, 2020 at 12:56 AM J=
on Mason &lt;<a href=3D"mailto:jdmason@kudzu.us">jdmason@kudzu.us</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Ju=
n 01, 2020 at 04:55:24PM -0500, Joshua Watt wrote:<br>
&gt; <br>
&gt; On 6/1/20 4:31 PM, Jon Mason wrote:<br>
&gt; &gt; On Sat, May 30, 2020 at 01:39:49PM -0500, Joshua Watt wrote:<br>
&gt; &gt; &gt; On Fri, May 29, 2020, 10:37 AM Bertrand Marquis &lt;<a href=
=
=3D"mailto:Bertrand.Marquis@arm.com" target=3D"_blank">Bertrand.Marquis@ar=
m.com</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; On 29 May 2020, at 16:32, Joshua Watt &lt;<a href=
=
=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.com</a=
>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; On 5/29/20 10:21 AM, Bertrand Marquis wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On 29 May 2020, at 16:14, Joshua Watt v=
ia <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_=
blank">lists.yoctoproject.org</a><br>
&gt; &gt; &gt; &gt; &lt;JPEWhacker=3D<a href=3D"mailto:gmail.com@lists.yoc=
toproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; w=
rote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Joshua Watt &lt;<a href=
=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.com</a=
>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; meta-arm/conf/layer.conf | 3 +--<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; 1 file changed, 1 insertion(+), 2 delet=
ions(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta-arm/conf/layer.conf b=
/meta-arm/conf/layer.conf<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; index d96e9f1..1c241d4 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --- a/meta-arm/conf/layer.conf<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta-arm/conf/layer.conf<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-=
arm =3D &quot;6&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; LAYERDEPENDS_meta-arm =3D &quot; \<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 core \<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 meta-python \<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -LAYERSERIES_COMPAT_meta-arm =3D &quot;=
warrior zeus dunfell&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +LAYERSERIES_COMPAT_meta-arm =3D &quot;=
gatesgarth&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Could you explain why you want to remove dun=
fell compatibility ?<br>
&gt; &gt; &gt; &gt; &gt; dunfell doesn&#39;t have the required python reci=
pes in oe-core, so it isn&#39;t<br>
&gt; &gt; &gt; &gt; compatible with it anymore.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Nothing has been tested or is compatible with gatesgar=
th right now so this<br>
&gt; &gt; &gt; &gt; change will really have a breaking impact.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; Right, you certainly wouldn&#39;t want to backport it to th=
e dunfell branch;<br>
&gt; &gt; &gt; this is just for master where the next release would be gat=
esgarth anyway.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Also, with the qemu support I added, I think we have reason=
able testing<br>
&gt; &gt; &gt; coverage on meta-arm, and in particular enough to have high=
 confidence in<br>
&gt; &gt; &gt; this change.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Finally, FWIW, upstream oe-core and meta-python have alread=
y made these<br>
&gt; &gt; &gt; changes on their master branches, so it seems like we would=
n&#39;t want a<br>
&gt; &gt; &gt; useless dependency on meta-python in meta-arm, *especially*=
 if the idea is<br>
&gt; &gt; &gt; to get other bsp layers to depend on meta-arm to consolidat=
e things like<br>
&gt; &gt; &gt; TF-A and optee.<br>
&gt; &gt; We currently have a requirement for dunfell compatability on the=
<br>
&gt; &gt; meta-arm master branch for Arm&#39;s BSP software releases (whic=
h will<br>
&gt; &gt; be YP based going forward).=C2=A0 To make a stable release for o=
ur<br>
&gt; &gt; customers, we need to draw a line between stablity of our depend=
ent<br>
&gt; &gt; layers and the latest code in the meta-arm layer.=C2=A0 This esp=
ecially<br>
&gt; &gt; relates to the BSPs Arm will be adding to meta-arm-bsp in this<b=
r>
&gt; &gt; release.<br>
&gt; &gt; <br>
&gt; &gt; We do not have to keep dunfell support in master after the relea=
se of<br>
&gt; &gt; gatesgarth, but we will need it until then.=C2=A0 So, please sta=
sh this<br>
&gt; &gt; patch until October (which will be here sooner than you think).<=
br>
&gt; <br>
&gt; Hmm, that&#39;s really unfortunate. That makes me think this layer is=
 not<br>
&gt; actually intended to be a centralized location for ARM related things=
, and<br>
&gt; I&#39;m probably not going to try and consolidate things from other l=
ayers here<br>
&gt; anymore. Not having a master branch that can be used with the master =
branch<br>
&gt; of OE-core really eliminates the possibility for me to use a BSP laye=
r like<br>
&gt; e.g. meta-rockchip for upstream development and testing if that BSP l=
ayer<br>
&gt; depends on meta-arm and meta-arm is perpetually stuck on the last rel=
ease.<br>
<br>
I&#39;m in no way saying that meta-arm master should not work with<br>
upstream master.=C2=A0 I&#39;m saying that we want to keep compatability w=
ith<br>
the previous release so that we can cut stable releases for customers.<br>=
</blockquote><div><br></div><div>I have been very supportive about meta-arm=
 as the central location for ARM pieces, and still believe it&#39;s the rig=
ht thing to do. But like Joshua, I find this discussion a bit disappointing=
. A layer is a &quot;social contract&quot; between the community behind thi=
s layer, and the rest of the OE/YP community. Refusing proper and meaningfu=
l community patches in master because it doesn&#39;t some &#39;internal&#39=
; needs doesn&#39;t feel right.</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
We have a requirement to release BSP SW based on YP.=C2=A0 Just like I<br>
would expect other vendors/people who want to use meta-arm.=C2=A0 So, ther=
e<br>
are a few ways we can approach this issue.<br>
<br>
1.=C2=A0 Merge patches onto dunfell branch<br>
2.=C2=A0 A development branch based on dunfell<br>
3.=C2=A0 Use master meta-arm-bsp and dunfell branches for meta-arm and<br>
meta-arm-toolchain<br>
4.=C2=A0 Keep master compatible with dunfell<br></blockquote><div><br></di=
v><div>I think the mistake we made (I am saying we, since I was involved in=
 that discussion) is to have a single tree that includes both the &#39;comm=
unity&#39; content that the ARM ecosystem wants to depend on and the specif=
ic ARM &quot;products&quot; that are needed by very few specific people (e.=
g. your BSP product).</div><div><br></div><div>I think #3 is the most sensi=
ble choice, e.g. you need to split meta-arm into &#39;community&#39; pieces=
 (I think that would correspond to meta-arm and meta-arm-toolchain layers) =
and your product pieces. When we build your product with OE, you would repl=
y on the &#39;community&#39; meta-arm, and if any hack or custom integratio=
n is needed, then you can do that in your product tree. You might even over=
lay things for some time there, it&#39;s fine for a product layer. Of cours=
e you will need to worry about doing the &#39;proper&#39; fix into the comm=
unity meta-arm at some point. But if you don&#39;t commit to maintaining a =
layer for the ARM community, the risk is that everyone will start forking m=
eta-arm recipes, which is not what we want.</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><br>
One is simple, we actually do our development on the dunfell branch.<br>
However, this breaks it from being a stable branch.=C2=A0 So, this is a<br=
>
non-starter=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Two is still simple, we do all of our internal development on a second<br>
dunfell branch (&quot;dunfell-dev&quot;) and make any releases we have off=
 of<br>
that.=C2=A0 The problem with this is the integration and testing.=C2=A0 If=
 there<br>
are multiple branches to test, can we expect developers to test every<br>
combination?=C2=A0 Also, there might be a need for different versions of<b=
r>
the patches depending on how much master and dunfell-dev diverge.<br></blo=
ckquote><div><br></div><div>That is an alternate variant of splitting the t=
rees.. doing your &#39;product&#39; in a product branch, and keep the expec=
ted branches (dunfell, master, ...) as community branches. It really depend=
s if meta-arm-bsp is really expected to be a community thing ever, or if it=
&#39;s your product only. In which case it might be more appropriate to spl=
it it apart.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Three is more complex.=C2=A0 Since only meta-arm-bsp needs releases, we ca=
n<br>
simply let that one float and fix the others on the stable branches.<br>
The problem with this is that we are currently needing to add recipes<br>
for things into meta-arm that others might need (like SCP, EDK2, etc).<br>
So, this will work once we have more stability in meta-arm, but right<br>
now we are adding too much stuff to make it viable for the next<br>
release.<br>
<br>
Four is simple, we keep compatability with dunfell and make the<br>
releases off of that.=C2=A0 The potential hazard with this is if something=
<br>
in YP master requires that compatability to be broken.=C2=A0</blockquote><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I presonally would like #4, because it is simple.=C2=A0 However, if this<b=
r>
will prevent others from using meta-arm, then let&#39;s have a discussion<=
br>
on it.=C2=A0 Perhaps I am not understanding something fundamental.<br></bl=
ockquote><div><br></div><div>But the whole discussion started because you s=
aid you needed to keep master compatible with dunfell. Even though as you s=
aid, it might fail eventually.=C2=A0</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
Thanks,<br>
Jon<br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Thanks,<br>
&gt; &gt; Jon<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Bertrand<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Bertrand<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; 2.17.1<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
<br>
</blockquote></div></div>

--000000000000d8ab6105a713c370--
